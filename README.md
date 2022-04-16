# Quiz Annotator for MOODLE

Using this teacher can annotate essay type question in quiz.
___

## Steps to add Quiz Annotator

1. Install imagemagick in your [machine](https://linoxide.com/install-latest-imagemagick-on-ubuntu-20-04/)
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
2. Copy the moodle_quiz_annotator folder to moodle folder location. Directory structure should be like this-
    ```bash
      .
      ├── moodle/
      └── moodle_quiz_annotator
          ├── files/
          ├── README.md
          └── Makefile
    ```

<details><summary> :warning: warning </summary>
 
#### after step 3 these files are going to be changed
    * moodle/quesiton/type/essay/renderer.php
    * moodle/mod/quiz/comment.php
</details>

 

3. Go to the Quiz_Annotator and in terminal run 
    * `sudo make quiz_annotator`

__Note you might need to change the variable MOODLE in Makefile according to your folder name__ 



## Steps to remove Quiz Annotator 
1. Go to the Quiz_Annotator folder and run 
    * `sudo make restore`

