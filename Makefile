# Makefile
# usage: run the "make" command in the root, than make <<cmd>>...
include $(wildcard lib/make/*.mk)
include $(wildcard src/make/*.mk)

SHELL = bash
PRODUCT := $(shell basename $$PWD)
TGT_ORG := $(shell export TGT_ORG=$${TGT_ORG:-csitea}; echo $${TGT_ORG})


.PHONY: install  ## @-> setup the whole local devops environment (alias)
install: install-devops


.PHONY: do-tpl-gen ## @-> apply the environment cnf file into the templates on the tpl-gen container
do-tpl-gen: demand_var-ENV demand_var-TGT_ORG
	docker exec -e ENV=$(ENV) -e TGT_ORG=$(TGT_ORG) ${PRODUCT}-tpl-gen-con make tpl-gen


.PHONY: do-ipam-process ## @-> process image albums.
do-ipam-process: demand_var-ENV demand_var-SRC demand_var-TGT demand_var-BUCKET
	docker exec \
		-e ENV=$(ENV) \
		-e SRC=$(SRC) \
		-e TGT=$(TGT) \
		-e BUCKET=$(BUCKET) \
		mi-brio-ipam-con \
		./run -a do_ipam_process_albums


.PHONY: create-static-website ## @-> create the resources and deploy the target org static website to AWS.
create-static-website: demand_var-ENV
	$(call static-website-provisioning,$(ENV),$(TGT_ORG))


.PHONY: delete-static-website ## @-> delete the resources of the target org static website to AWS.
delete-static-website: demand_var-ENV
		$(call static-website-divesting,$(ENV),$(TGT_ORG))
