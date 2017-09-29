const gulp = require('gulp');
const zip = require('gulp-zip');

gulp.task('default', () =>
    gulp.src('index.js')
        .pipe(zip('function.zip'))
        .pipe(gulp.dest('../infrastructure'))
);