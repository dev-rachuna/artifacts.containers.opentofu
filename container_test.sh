#!/usr/bin/env bash
echo "🧪 Testing opentofu container image"
tofu --version

echo "🧪 Testing terraform-docs container image"
terraform-docs --version

echo "🧪 Testing tflint container image"
tflint --version