
resource "k8s_manifest" "nginx-deployment" {
    content = <<-EOT
        apiVersion: apps/v1
        kind: Deployment
        metadata:
          name: nginx-deployment
          labels:
            app: nginx
        spec:
          replicas: 2
          selector:
            matchLabels:
              app: nginx
          template:
            metadata:
              labels:
                app: nginx
            spec:
              containers:
              - name: nginx
                image: nginx:1.7.9
                ports:
                - containerPort: 80
                command: ["/bin/false"]
        EOT
    timeouts {
        create = "20s"
    }
}
