# CMake generated Testfile for 
# Source directory: /home/jyry/.emacs.d/elpa/irony-1.3.1/server/test/elisp
# Build directory: /home/jyry/.emacs.d/elpa/irony-1.3.1/build/test/elisp
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(check-irony-el "/usr/bin/emacs" "-Q" "--batch" "-l" "package" "--eval" "(package-initialize)" "--eval" "(unless (require 'cl-lib nil t) (package-refresh-contents) (package-install 'cl-lib))" "-l" "/home/jyry/.emacs.d/elpa/irony-1.3.1/server/test/elisp/irony.el" "-f" "ert-run-tests-batch-and-exit")
set_tests_properties(check-irony-el PROPERTIES  TIMEOUT "15" _BACKTRACE_TRIPLES "/home/jyry/.emacs.d/elpa/irony-1.3.1/server/test/elisp/CMakeLists.txt;34;add_test;/home/jyry/.emacs.d/elpa/irony-1.3.1/server/test/elisp/CMakeLists.txt;45;add_ert_test;/home/jyry/.emacs.d/elpa/irony-1.3.1/server/test/elisp/CMakeLists.txt;0;")
add_test(check-irony-iotask-el "/usr/bin/emacs" "-Q" "--batch" "-l" "package" "--eval" "(package-initialize)" "--eval" "(unless (require 'cl-lib nil t) (package-refresh-contents) (package-install 'cl-lib))" "-l" "/home/jyry/.emacs.d/elpa/irony-1.3.1/server/test/elisp/irony-iotask.el" "-f" "ert-run-tests-batch-and-exit")
set_tests_properties(check-irony-iotask-el PROPERTIES  TIMEOUT "15" _BACKTRACE_TRIPLES "/home/jyry/.emacs.d/elpa/irony-1.3.1/server/test/elisp/CMakeLists.txt;34;add_test;/home/jyry/.emacs.d/elpa/irony-1.3.1/server/test/elisp/CMakeLists.txt;46;add_ert_test;/home/jyry/.emacs.d/elpa/irony-1.3.1/server/test/elisp/CMakeLists.txt;0;")
add_test(check-irony-cdb-json-el "/usr/bin/emacs" "-Q" "--batch" "-l" "package" "--eval" "(package-initialize)" "--eval" "(unless (require 'cl-lib nil t) (package-refresh-contents) (package-install 'cl-lib))" "-l" "/home/jyry/.emacs.d/elpa/irony-1.3.1/server/test/elisp/irony-cdb-json.el" "-f" "ert-run-tests-batch-and-exit")
set_tests_properties(check-irony-cdb-json-el PROPERTIES  TIMEOUT "15" _BACKTRACE_TRIPLES "/home/jyry/.emacs.d/elpa/irony-1.3.1/server/test/elisp/CMakeLists.txt;34;add_test;/home/jyry/.emacs.d/elpa/irony-1.3.1/server/test/elisp/CMakeLists.txt;47;add_ert_test;/home/jyry/.emacs.d/elpa/irony-1.3.1/server/test/elisp/CMakeLists.txt;0;")
