# src/make/clean-install-dockers.func.mk
# only the clean install dockers calls here ...
# TODO: figure a more elegant and generic way to avoid this copy paste ...
#

SHELL = bash
PRODUCT := $(shell basename $$PWD)
TGT_ORG := $(shell export TGT_ORG=$${TGT_ORG:-csitea}; echo $${TGT_ORG})

.PHONY: clean-install-csitea-web  ## @-> setup the whole local csitea-web environment no cache!
clean-install-csitea-web:
	$(call clean-install-img,csitea-web)


.PHONY: clean-install-ipam  ## @-> setup the whole local item-product environment no cache!
clean-install-ipam:
	$(call clean-install-img,ipam)


.PHONY: clean-install-sysops  ## @-> setup the whole local sysops environment no cache!
clean-install-sysops:
	$(call clean-install-img,sysops)


.PHONY: clean-install-tpl-gen  ## @-> setup the whole local tpl-gen environment no cache!
clean-install-tpl-gen:
	$(call clean-install-img,tpl-gen)


.PHONY: clean-install-devops  ## @-> setup the whole local devops environment no cache!
clean-install-devops:
	$(call clean-install-img,devops)
