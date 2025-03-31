const TAG_META_ALL = 'meta:all-tags';

function setupTagFilter(allTags) {
  const container = document.querySelector('#tag-filter');
  const postsWithTags = readPostsWithTags();

  const appendButton = (label, tag) =>
    appendFilterButton(postsWithTags, container, label, tag);

  allTags.forEach(tag => appendButton(tag, tag));
  appendButton('all tags', TAG_META_ALL).click();

  container.removeAttribute('style');
}

function readPostsWithTags() {
  return [...document.querySelectorAll('#posts > ul > li')].map(elem => {
    const tags = [...elem.querySelectorAll('[data-tag]')]
      .map(tag => tag.dataset.tag);

    return {
      elem,
      defaultDisplay: elem.style.display,
      tags
    };
  });
}

function appendFilterButton(postsWithTags, container, label, tag) {
  const btn = document.createElement('button');
  btn.innerText = label;
  btn.dataset.tag = tag;

  btn.addEventListener(
    'click',
    () => rerender(postsWithTags, container, tag)
  );

  container.appendChild(btn);

  return btn;
}

function rerender(allPosts, buttonsContainer, selectedTag) {
  allPosts.forEach(post => {
    const show = selectedTag == TAG_META_ALL ||
      post.tags.includes(selectedTag);

    post.elem.style.display = (show ? post.defaultDisplay : 'none');
  });

  buttonsContainer.querySelectorAll('[data-tag]').forEach(btn => {
    const selected = selectedTag == btn.dataset.tag;
    btn.disabled = selected;
  });
}

