#!/bin/bash

#Check if .env file exists
if [ ! -f .env ]; then
    echo -e "File .env does not exist"
    exit 1
fi

set -o allexport
source .env
set +o allexport

# General variables
SUBSCRIPTION_ID=$(az account show --query id -o tsv)
RESOURCE_GROUP="DevBoxDemos"
LOCATION="westeurope"

# Virtual network variables
VNET_NAME="devbox-vnet"
SUBNET_NAME="devboxes-subnet"

# Key vault variables
KEY_VAULT_NAME="madriddevcenterkv"
SECRET_NAME="gh-pat"

# Gallery image variables
# For Image Builder
IMAGE_BUILDER_GALLERY_NAME="image_builder_gallery"
VSCODE_IMAGE_DEFINITION="vscodeImage"

# For Packer
PACKER_GALLERY_NAME="packer_gallery"
PACKER_GALLERY_RESOURCE_GROUP="packer-rg"

# Image Builder variables
IMAGE_BUILDER_IDENTITY="image-builder-identity"

# Custom image
VSCODE_IMAGE_NAME="vscodeWinImage"
VSCODE_RUN_OUTPUT_NAME="vscodeWinImageRunOutput"
VSCODE_IMAGE_TEMPLATE="vscodeTemplate"

# Dev center variables
DEV_CENTER_NAME=madrid-dev-center

# Project
ENTRA_ID_GROUP_NAME="Devs"

# Size of the dev box
STORAGE_TYPE="ssd_256gb"
SKU_NAME="general_i_8c32gb256ssd_v2"

# Variables for the basic dev box
DEV_BOX_DEFINITION_FOR_BASIC_DEMO="vsbox"
DEV_BOX_POOL_NAME_FOR_BASIC_DEVBOX="devpool"
IMAGE_NAME_FROM_THE_DEFAULT_GALLERY="microsoftvisualstudio_visualstudioplustools_vs-2022-ent-general-win11-m365-gen2"

# Azure Deployment Environments
CATALOG_NAME="ade-catalog"
PROJECT_FOR_ENVIRONMENTS="tour-of-heroes-environments"
DEV_ENVIRONMENT_TYPE="dev"

echo -e "Variables set"

# Registrations for your suscription

az feature register --name VMHibernationPreview --namespace Microsoft.Compute