INSTALL = install
INSTALL_DATA = $(INSTALL) -m 644

appdir = /opt/hello-app
configdir = /etc/hello-app

all:
	bundle install --deployment

install: all installdirs
	cp -r .bundle vendor $(DESTDIR)$(appdir)
	$(INSTALL_DATA) -t $(DESTDIR)$(appdir)	\
		Gemfile				\
		Gemfile.lock			\
		config.ru			\
		app.rb

	$(INSTALL_DATA) -t $(DESTDIR)$(configdir)	\
		config/config.yml

installdirs:
	mkdir -p $(DESTDIR)$(appdir)
	mkdir -p $(DESTDIR)$(configdir)

clean:
	rm -rf .bundle vendor

.PHONY: all clean install installdirs
