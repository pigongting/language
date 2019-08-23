const mock = {
  // 'GET /api/v1/dashboard': { users: [1, 2, 3] },
};

require('fs').readdirSync(require('path').join(__dirname, '')).filter(item => ((item !== 'index.js') && (item !== 'config.js'))).forEach((file) => {
  Object.assign(mock, require(`./${file}`));
});

module.exports = mock;