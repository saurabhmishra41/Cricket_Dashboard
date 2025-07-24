document.addEventListener('DOMContentLoaded', function () {
  const startLink = document.getElementById('start');
  const hostInput = document.getElementById('host');
  const visitorInput = document.getElementById('visitor');
  const tossRadios = document.querySelectorAll('input[name="toss"]');
  const optRadios = document.querySelectorAll('input[name="opted"]');
  const oversInput = document.getElementById('over');

  // Function to check if all inputs are valid
  function validateForm() {
    const hostFilled = hostInput.value.trim() !== '';
    const visitorFilled = visitorInput.value.trim() !== '';
    const tossSelected = Array.from(tossRadios).some(radio => radio.checked);
    const optSelected = Array.from(optRadios).some(radio => radio.checked);
    const oversFilled = oversInput.value.trim() !== '';

    const allValid = hostFilled && visitorFilled && tossSelected && optSelected && oversFilled;

    if (allValid) {
      startLink.classList.remove('disabled');
      startLink.style.pointerEvents = 'auto';
      startLink.style.opacity = '1';
    } else {
      startLink.classList.add('disabled');
      startLink.style.pointerEvents = 'none';
      startLink.style.opacity = '0.5';
    }
  }

  // Initial disable
  startLink.style.pointerEvents = 'none';
  startLink.style.opacity = '0.5';

  // Attach event listeners
  hostInput.addEventListener('input', validateForm);
  visitorInput.addEventListener('input', validateForm);
  oversInput.addEventListener('input', validateForm);
  tossRadios.forEach(radio => radio.addEventListener('change', validateForm));
  optRadios.forEach(radio => radio.addEventListener('change', validateForm));
});
