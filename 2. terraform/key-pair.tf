resource "tls_private_key" "priv-key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "id_rsa_games247" {
  content = tls_private_key.priv-key.private_key_pem
  filename = "${var.keyPath}/id_rsa_games247"
}

data "local_file" "encoded-key" {
  filename = "${var.keyPath}/id_rsa_games247"

  depends_on = [
    local_file.id_rsa_games247
  ]
}