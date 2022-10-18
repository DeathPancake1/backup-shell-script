backup:
	mkdir -p ${dest}
	./backupd.sh ${src} ${dest} ${secs} ${max}
	