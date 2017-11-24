import Typed from 'typed.js';

function loadDynamicBannerText() {
  new Typed('#banner-typed-text', {
    strings: ["Will you dare?", "There's only one way to know"],
    typeSpeed: 80,
    loop: true
  });
}

export { loadDynamicBannerText };
