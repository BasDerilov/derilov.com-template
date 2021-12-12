# usage: include it in your Makefile by:
# include lib/make/tpl-gen.mk

.PHONY: tpl-gen ## @-> apply the environment cnf file into the templates
tpl-gen: demand_var-ENV demand_var-TGT_ORG
	cd src/python/tpl-gen && poetry run start
