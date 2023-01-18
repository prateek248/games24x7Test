output  "base64-encoded-file" {
  value = data.local_file.encoded-key.content_base64
}
