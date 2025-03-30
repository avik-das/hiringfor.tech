#!/usr/bin/env ruby

require 'io/console'
require 'readline'

trap("INT", "SIG_IGN")

post_filenames = Dir.glob('_posts/*.md')

class String
  def bold
    "\e[1m#{self}\e[0m"
  end
end

def clear
  # Don't use `puts` to avoid printing a newline
  print "\e[2J\e[H"
end

AVAILABLE_TAGS = %w{
  employers
  interviewers
  candidates
}

def read_new_tags(existing_tags)
  Readline.pre_input_hook = proc {
    Readline.insert_text(existing_tags.join(" "))
    Readline.redisplay
  }

  Readline.completion_proc =
    proc { |s| AVAILABLE_TAGS.grep(/^#{Regexp.escape(s)}/) }

  inp = Readline.readline("> ")
  return existing_tags if inp.nil?

  all_new_tags = inp
    .split(" ")
    .map(&:strip)

  # By performing the intersection in this direction, we ensure the tags are
  # always in the order specified in the canonical list of tags. It also ensures
  # tags are only included once in the final output.
  return AVAILABLE_TAGS.filter { |t| all_new_tags.include?(t) }
end

def update_frontmatter_variable(filename, key, new_value)
  contents = File.read(filename)

  line =
    if new_value.empty?
      ""
    else
      "#{key}: #{new_value}"
    end

  if match = /^(#{Regexp.escape(key)}: .*)/.match(contents)
    if line.empty?
      contents.sub!("#{match.captures[0]}\n", "")
    else
      contents.sub!(match.captures[0], line)
    end
  else
    if !line.empty?
      contents.sub!("\n---", "\n#{line}\n---")
    end
  end

  File.write(filename, contents)
end

i = 0
is_editing = true
while is_editing
  filename = post_filenames[i]

  title = nil
  tags = []

  File.open(filename, 'r') do |file|
    is_reading_frontmatter = false
    file.each_line do |line|
      line.strip!

      if line == '---'
        if is_reading_frontmatter
          break
        else
          is_reading_frontmatter = true
          next
        end
      end

      if is_reading_frontmatter
        case line
        when /^title: "(.+)"$/ then title = $1
        when /^tags: (.+)$/ then tags = $1.split(' ')
        end
      end
    end
  end

  clear

  puts "POST: #{title.bold}"
  if tags.empty?
    puts "NO TAGS"
  else
    puts "TAGS:"
    tags.each do |tag|
      puts "  - #{tag}"
    end
  end

  available_cmds = [:t, :r]
  available_cmds << :p if i > 0
  available_cmds << :n if i < post_filenames.size - 1
  available_cmds << :q

  is_awaiting_cmd = true
  while is_awaiting_cmd
    puts
    puts "OPTIONS:"
    puts
    puts "  - t: edit tags"
    puts "  - r: read contents"
    puts "  - p: prev post" if available_cmds.include?(:p)
    puts "  - n: next post" if available_cmds.include?(:n)
    puts "  - q: quit"
    puts

    cmd = nil?
    cmd = STDIN.getch.intern until available_cmds.include?(cmd)

    case cmd
    when :q
      is_editing = false
      is_awaiting_cmd = false
    when :r
      puts
      puts File.read(filename)
      puts
      # Wait for the next command
    when :p
      i = i - 1
      is_awaiting_cmd = false
    when :n 
      i = i + 1
      is_awaiting_cmd = false
    when :t
      new_tags = read_new_tags(tags)
      update_frontmatter_variable(filename, 'tags', new_tags.join(" "))

      # Technically, we are awaiting for another command. But, exit this loop
      # and go back to reading the file from scratch to show the updated
      # contents.
      is_awaiting_cmd = false
    end
  end
end
