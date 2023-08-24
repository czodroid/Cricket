# Filename: Makefile
# Author: Olivier Sirol <czo@free.fr>
# License: GPL-2.0 (http://www.gnu.org/copyleft)
# File Created: Jan 2012
# Last Modified: Thursday 24 August 2023, 18:15
# Description:
#               Makefile for this project
#
# Copyright: (C) 2012-2023 Olivier Sirol <czo@free.fr>

all: release

release:
	./gradlew assembleRelease
	@echo "<- done!"

scp:
	scp app/build/outputs/apk/release/org.czo.cricket-`date +%Y%m%d`-release.apk czo@dalmore:/tank/data/czo/www/ananas.czo.wf/intranet/download/sa/software/apk
	@echo "<- done!"

debug:
	./gradlew assembleDebug --warning-mode all
	@echo "<- done!"

clean:
	./gradlew clean
	rm -fr .gradle
	rm -fr build
	rm -fr app/build app/libs app/release app/debug
	rm -fr Cricket.iml app/app.iml
	rm -fr captures
	rm -fr .idea
	@echo "<- done!"

realclean: clean
	rm -f *.apk
	@echo "<- done!"

fclean: realclean

re: realclean all

