RAILS_ENV = test
BUNDLE = RAILS_ENV=${RAILS_ENV} bundle
BUNDLE_OPTIONS = --jobs=3
RSPEC = rspec
APPRAISAL = appraisal

all: test

test: bundler appraisal
	${BUNDLE} exec ${APPRAISAL} ${RSPEC} spec 2>&1

bundler:
	if ! gem list bundler -i > /dev/null; then \
	  gem install bundler; \
	fi
	${BUNDLE} install ${BUNDLE_OPTIONS}

appraisal:
	${BUNDLE} exec ${APPRAISAL} install
