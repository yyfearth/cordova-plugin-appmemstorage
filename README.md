# cordova-plugin-appmemstorage

Apache Cordova plugin for setting and retrieving string values in app memory.

Compare with LocalStorage and SessionStorage, 
it provide async APIs and keep all data in app's memory instead of store inside of a database created by the web view.  
All data will be kept during page reload or navigation as lone as cordova plugins can be accessed.  
All data will be lost when the app is killed.

Currently only **iOS** and **Android** are supported. It store all key value pairs in a NSMutableDictionary on iOS, or a HashMap on Android.

## Installation

The plugin can be installed via the Cordova command line interface:

```bash
cordova plugin add https://github.com/yyfearth/cordova-plugin-appmemstorage.git
```

## Usage

### Set a string value with a key

```js
appMemStorage.set('key', 'value').then(function() {
    console.log('success');
}, function(err) {
    console.log(err);
});
```

### Get a string value by a key

```js
appMemStorage.get('key').then(function(value) {
    console.log(value);
}, function(err) {
    console.log(err);
});
```

### Remove a string value by a key

```js
appMemStorage.remove('key').then(function() {
    console.log('removed'); // success even if the key is not exist
}, function(err) {
    console.log(err);
});
```

### Get all keys and values as an object

```js
appMemStorage.all().then(function(dict) {
    console.log(dict); // return as an object e.g. { "key1": "value1", "key2": "value2" }
}, function(err) {
    console.log(err);
});
```

### Get the number of the key value pairs

```js
appMemStorage.count().then(function(count) {
    console.log(count); // >= 0
}, function(err) {
    console.log(err);
});
```

### Get all keys

```js
appMemStorage.keys().then(function(keys) {
    console.log(keys); // as an array of strings or an empty array
}, function(err) {
    console.log(err);
});
```

### Remove all key value pairs

```js
appMemStorage.clear().then(function() {
    console.log('all key/value pairs have been removed');
}, function(err) {
    console.log(err);
});
```

##<a name="license"></a> LICENSE

The MIT License (MIT)

Copyright (c) 2016 Wilson Young

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
