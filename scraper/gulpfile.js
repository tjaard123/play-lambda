// Use gulp to create a zip file for upload to AWS Lambda
const gulp = require('gulp');
const zip = require('gulp-zip');

gulp.task('default', () => {
   gulp.src('index.js')
      .pipe(zip('scraper.zip'))
      .pipe(gulp.dest('../infrastructure/lambda'))
});
