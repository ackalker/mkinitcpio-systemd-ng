all:

install:
	install -Dm644 \
		initcpio-install-systemd \
		$(DESTDIR)/usr/lib/initcpio/install/systemd-ng
	install -d -m755 $(DESTDIR)/usr/lib/systemd
	cp -a initrd{,-preset} $(DESTDIR)/usr/lib/systemd/

.PHONY: all install
