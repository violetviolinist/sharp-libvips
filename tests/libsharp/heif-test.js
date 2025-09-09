const sharp = require('sharp')
const fs = require('fs')
const path = require('path')

// const buffer1 = fs.readFileSync(path.join(__dirname, '_80MP_10MB.avif'))
const buffer1 = fs.readFileSync(path.join(__dirname, 'testavif.avif'))
const buffer = fs.readFileSync('../test.jpg')

async function doit() {
    // process input buffer and write a reszied file
    console.log(await sharp(buffer).metadata())
    console.log(await sharp(buffer1).metadata())
    await sharp(buffer).toFormat("avif").toFile("out.avif")
    await sharp(buffer1).resize(100).toFormat("jpg").toFile("out1.jpg")
}

doit()
