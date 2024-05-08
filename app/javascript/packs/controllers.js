// app/javascript/packs/controllers.js

// Import tất cả các tệp JavaScript từ thư mục "controllers"
const controllers = require.context('../controllers', true, /\.js$/);
controllers.keys().forEach(controllers);