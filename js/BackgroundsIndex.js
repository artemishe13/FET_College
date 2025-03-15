window.onload = function () {
  const backgrounds = [
    'img/Earth-planet-asteroid-sci-fi.jpg',
    'img/Zemlya2.jpg',
    'img/Zemlya3.jpg',
    'img/Zemlya4.jpg',
    'img/Zemlya5.jpg'
  ];

  let previousIndex = -1;
  let currentIndex = -1;

  function preloadImages(images) {
    return Promise.all(images.map(src => {
      return new Promise((resolve, reject) => {
        const img = new Image();
        img.onload = resolve;
        img.onerror = reject;
        img.src = src;
      });
    }));
  }

  function getRandomIndex() {
    let randomIndex;
    do {
      randomIndex = Math.floor(Math.random() * backgrounds.length);
    } while (randomIndex === previousIndex);
    previousIndex = currentIndex;
    currentIndex = randomIndex;
    return randomIndex;
  }

  function changeBackground() {
    const nextIndex = getRandomIndex();
    const nextImage = backgrounds[nextIndex];
    
    // Create a new element with the following background
    const nextBackground = document.createElement('div');
    nextBackground.style.backgroundImage = `url('${nextImage}')`;
    nextBackground.style.position = 'fixed';
    nextBackground.style.top = '0';
    nextBackground.style.left = '0';
    nextBackground.style.width = '100%';
    nextBackground.style.height = '100%';
    nextBackground.style.zIndex = '-1';
    nextBackground.style.opacity = '0';
    nextBackground.style.transition = 'opacity 1s ease-in-out';
    
    document.body.appendChild(nextBackground);

    // Smoothly show the new background
    setTimeout(() => {
      nextBackground.style.opacity = '1';
    }, 50);

    // Remove the previous background after the transition is complete
    setTimeout(() => {
      const oldBackgrounds = document.querySelectorAll('body > div[style*="background-image"]');
      oldBackgrounds.forEach((bg, index) => {
        if (index < oldBackgrounds.length - 1) {
          bg.remove();
        }
      });
    }, 1050);

    setTimeout(changeBackground, 5000);
  }

  preloadImages(backgrounds).then(() => {
    
    changeBackground();
  });
};