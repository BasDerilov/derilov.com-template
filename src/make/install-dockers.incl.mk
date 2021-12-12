# src/make/install-dockers.func.mk
# only the install dockers calls here ...
# TODO: figure a more elegant and generic way to avoid this copy paste ...
#

SHELL = bash
PRODUCT := $(shell basename $$PWD)
TGT_ORG := $(shell export TGT_ORG=$${TGT_ORG:-csitea}; echo $${TGT_ORG})


.PHONY: install-csitea-web  ## @-> setup the whole local csitea-web environment
install-csitea-web:
	$(call install-img,csitea-web)


.PHONY: install-ipam  ## @-> setup the whole local item product environment
install-ipam:
	$(call install-img,ipam)


.PHONY: install-sysops  ## @-> setup the whole local sysops environment
install-sysops:
	$(call install-img,sysops)


.PHONY: install-tpl-gen  ## @-> setup the whole local tpl-gen environment
install-tpl-gen:
	$(call install-img,tpl-gen)


.PHONY: install-devops  ## @-> setup the whole local devops environment
install-devops:
	$(call install-img,devops)
