.PHONY: all generate restore quiz_annotator build backup

MOODLE="moodle"
MOD_QUIZ="mod/quiz"
QUESTION_TYPE_ESSAY="question/type/essay"

all: quiz_annotator 

quiz_annotator: build backup generate
	@echo "quiz annotator is ready to use."




build:
	@mkdir -p backup/${MOD_QUIZ}
	@mkdir -p backup/${QUESTION_TYPE_ESSAY}

backup:
	@echo "making backup ready"
	@cp -v -p ./../${MOODLE}/${MOD_QUIZ}/comment.php  ./backup/${MOD_QUIZ}/
	@cp -v -p ./../${MOODLE}/${QUESTION_TYPE_ESSAY}/renderer.php ./backup/${QUESTION_TYPE_ESSAY}/ 


generate:
	@echo "Copying php files..."
	@cp -v -p ./files/${MOD_QUIZ}/comment.php  ./../${MOODLE}/${MOD_QUIZ}/
	@cp -v -p ./files/${MOD_QUIZ}/annotator.php  ./../${MOODLE}/${MOD_QUIZ}/
	@cp -v -p ./files/${MOD_QUIZ}/myindex.html  ./../${MOODLE}/${MOD_QUIZ}/
	@cp -v -p ./files/${MOD_QUIZ}/mypdfannotate.css  ./../${MOODLE}/${MOD_QUIZ}/
	@cp -v -p ./files/${MOD_QUIZ}/mypdfannotate.js  ./../${MOODLE}/${MOD_QUIZ}/
	@cp -v -p ./files/${MOD_QUIZ}/myscript.js    ./../${MOODLE}/${MOD_QUIZ}/
	@cp -v -p ./files/${MOD_QUIZ}/mystyles.css  ./../${MOODLE}/${MOD_QUIZ}/
	@cp -v -p ./files/${MOD_QUIZ}/upload.php  ./../${MOODLE}/${MOD_QUIZ}/
	@cp -v -p ./files/${QUESTION_TYPE_ESSAY}/renderer.php  ./../${MOODLE}/${QUESTION_TYPE_ESSAY}/
	@echo "copying done"


restore:
	@echo "removing php files"
	@rm -f ./../${MOODLE}/${MOD_QUIZ}/annotator.php
	@rm -f ./../${MOODLE}/${MOD_QUIZ}/myindex.html
	@rm -f ./../${MOODLE}/${MOD_QUIZ}/mypdfannotate.css
	@rm -f ./../${MOODLE}/${MOD_QUIZ}/mypdfannotate.js
	@rm -f ./../${MOODLE}/${MOD_QUIZ}/myscript.js 
	@rm -f ./../${MOODLE}/${MOD_QUIZ}/mystyles.css
	@rm -f ./../${MOODLE}/${MOD_QUIZ}/upload.php
	@rm -f ./../${MOODLE}/${QUESTION_TYPE_ESSAY}/renderer.php
	@echo "restoring files"
	@cp -v -p ./backup/${MOD_QUIZ}/comment.php ./../${MOODLE}/${MOD_QUIZ}/  
	@cp -v -p ./backup/${QUESTION_TYPE_ESSAY}/renderer.php ./../${MOODLE}/${QUESTION_TYPE_ESSAY}/
