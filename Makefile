UNITSDIR=usr/lib/systemd/initrd
PRESETSDIR=usr/lib/systemd/initrd-preset

all:

install:
	install -Dm644 \
		initcpio-install-systemd \
		$(DESTDIR)/usr/lib/initcpio/install/systemd-ng
	$(call install-drop-in,emergency.service,sulogin-force.conf,50)
	$(call install-drop-in,rescue.service,sulogin-force.conf,50)
	$(call install-drop-in,systemd-udevd.service,systemd-udevd-resolve-never.conf,50)
	$(call install-preset,80-initrd.preset)
	$(call install-preset,99-default.preset)

.PHONY: all install

# Install a drop-in snippet for a systemd unit file
#   $1: name of unit file
#   $2: name of drop-in snippet
#   $3: priority
define install-drop-in
	install -Dm644 "drop-ins/$2" "$(DESTDIR)/$(UNITSDIR)/$1.d/$3-$2"
endef

# Install a systemd preset file for use in the initrd phase
#   $1: name of preset file
define install-preset
	install -Dm644 "initrd-preset/$1" "$(DESTDIR)/$(PRESETSDIR)/$1"
endef
