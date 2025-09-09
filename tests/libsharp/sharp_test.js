var sharp = require('sharp');
var fs = require('fs');

var sourceBuffer = fs.readFileSync('../test.jpg');

const pipeline = sharp(sourceBuffer).rotate();
pipeline.resize(50,50);

pipeline.toBuffer().then((buffer) => {
	fs.writeFileSync('demo.jpg', buffer);
}, (err) => {
	console.log(err);
});


// var sourceBuffer1 = fs.readFileSync('sample1.heif');
// var image = sharp(sourceBuffer1).clone();
// image.jpeg();
// image.toBuffer().then((buffer) => {
// 	fs.writeFileSync('demo.jpg', buffer);
// }, (err) => {
// 	console.log(err);
// });