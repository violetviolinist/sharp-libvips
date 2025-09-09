//process.env.OPENCV4NODEJS_DISABLE_EXTERNAL_MEM_TRACKING=1
const cv = require('opencv4nodejs');
console.log(cv.HAAR_FRONTALFACE_ALT);
//const classifier = new cv.CascadeClassifier('./haarcascade_frontalface_alt.xml');

const fs = require('fs');

console.log(cv.modules);

console.log(process.env.LD_LIBRARY_PATH);
console.log(process.env.LIBRARY_PATH);
console.log(process.env.PATH);
var image = cv.imread('../test.jpg');


fs.readFile('../test.jpg', (err, data) => {
    if (err) throw err; // Fail if the file can't be read.
    const classifier = new cv.CascadeClassifier(cv.HAAR_FRONTALFACE_ALT);
    var oldData = data;
    let str = data.toString('base64')
    imageBuffer = Buffer.from(str, 'base64');
    const img = cv.imdecode(imageBuffer);
    const { objects, numDetections } = classifier.detectMultiScale(img.bgrToGray());
    console.log(objects);
    let corners = cv.goodFeaturesToTrack(img.bgrToGray(),25,0.01,10);
    console.log(corners);
});
