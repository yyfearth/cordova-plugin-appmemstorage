var exec = require('cordova/exec');

var AppMemStorage = {
    set: function(key, value) {
        return new Promise(function(resolve, reject) {
            exec(resolve, reject, 'AppMemStorage', 'set', ['' + key, '' + value]);
        });
    },

    get: function(key) {
        return new Promise(function(resolve, reject) {
            exec(resolve, reject, 'AppMemStorage', 'get', ['' + key]);
        });
    },

    remove: function(key) {
        return new Promise(function(resolve, reject) {
            exec(resolve, reject, 'AppMemStorage', 'remove', ['' + key]);
        });
    },

    all: function() {
        return new Promise(function(resolve, reject) {
            exec(resolve, reject, 'AppMemStorage', 'all', []);
        });
    },

    count: function() {
        return new Promise(function(resolve, reject) {
            exec(resolve, reject, 'AppMemStorage', 'count', []);
        });
    },

    keys: function() {
        return new Promise(function(resolve, reject) {
            exec(resolve, reject, 'AppMemStorage', 'keys', []);
        });
    },

    clear: function() {
        return new Promise(function(resolve, reject) {
            exec(resolve, reject, 'AppMemStorage', 'clear', []);
        });
    }
};

module.exports = AppMemStorage;
