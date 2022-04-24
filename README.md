# Quiz Annotator for MOODLE

Using this teacher can annotate essay type question in quiz.
![demo](/src/demo.gif)
___

## Steps to add Quiz Annotator

1. Install imagemagick in your [machine](https://linoxide.com/install-latest-imagemagick-on-ubuntu-20-04/) for ubuntu you can follow this.
    * `sudo apt install imagemagick`
    *  update __rights="none"__ to __rights=read|write__ in __/etc/ImageMagick-6/policy.xml__  for __pattern="pdf"__ , see [this](https://askubuntu.com/questions/1181762/imagemagickconvert-im6-q16-no-images-defined)
    ```xml
        <!-- disable ghostscript format types -->
        <policy domain="coder" rights="none" pattern="PS" />
        <policy domain="coder" rights="none" pattern="EPS" />
        <policy domain="coder" rights="none" pattern="PDF" /> <------- Here!!
        <policy domain="coder" rights="none" pattern="XPS" />

    ```

    * (optional) now to check imagemagick is working , convert a png file to a pdf ,in terminal run 
        * `convert file.png file.pdf`  
2. Download the zip file from this repository, extract in and copy the extracted folder moodle_quiz_annotator to the moodle root folder location `/path/to/moodle`. For example in ubuntu directory structure should be like this-
    ```bash
      .
      ├── /var/www/html/moodle/
      └── /var/www/html/moodle_quiz_annotator
    ```

<details><summary> :warning: warning </summary>
 
#### after step 3 these files are going to be changed
    * moodle/quesiton/type/essay/renderer.php
    * moodle/mod/quiz/comment.php
</details>

 

3. Go to the moodle_quiz_annotator and in terminal run , as of now it supports MOODLE_VERSION 3.6 and 3.11
    * `sudo make quiz_annotator MOODLE_VERSION=x.x` 
    * for example _sudo make quiz_annotator MOODLE_VERSION=3.6_

__Note you might need to change the variable MOODLE in Makefile according to your folder name if you followed default settings while installing moodle then this is not needed but if you changed the name from moodle to something else then you need to update here the same.__ 



## Steps to remove Quiz Annotator 
1. Go to the moodle_quiz_qnnotator folder ,open terminal and run 
    * `sudo make restore`

