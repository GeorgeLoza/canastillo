/** @type {import('tailwindcss').Config} */
export default {
    content: [
        "./resources/**/*.blade.php",
        "./resources/**/*.js",
        "./resources/**/*.vue",
        './resources/**/*.blade.php',
        './vendor/masmerise/livewire-toaster/resources/views/*.blade.php',
      ],
  theme: {
    extend: {
        fontSize: {
            '2xs': '0.625rem', // 10px, más pequeño que xs
            '3xs': '0.5rem',   // 8px, más pequeño que 2xs
          },
    },
  },
  plugins: [],
}

