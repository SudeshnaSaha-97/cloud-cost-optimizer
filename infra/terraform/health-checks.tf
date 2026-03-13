resource "null_resource" "backend_smoke_test" {
  provisioner "local-exec" {
    command = <<EOT
      for i in $(seq 1 10); do
        INGRESS_IP=$(kubectl get ingress cloud-cost-ingress -n default -o jsonpath='{.status.loadBalancer.ingress[0].ip}' || true)
        if [ -n "$INGRESS_IP" ]; then
          echo "Ingress IP: $INGRESS_IP"
          for j in $(seq 1 5); do
            STATUS=$(curl -s -o /dev/null -w "%%{http_code}" "http://$INGRESS_IP/api/health")
            if [ "$STATUS" = "200" ]; then
              echo $STATUS > backend_status.txt
              exit 0
            fi
            echo "Backend health check attempt $j failed (HTTP $STATUS), retrying in 20s..."
            sleep 20
          done
          echo "000" > backend_status.txt
          exit 1
        fi
        echo "Ingress IP not ready, retrying in 30s..."
        sleep 30
      done
      echo "000" > backend_status.txt
      exit 1
    EOT
    interpreter = ["/bin/bash", "-c"]
  }
}

resource "null_resource" "frontend_smoke_test" {
  provisioner "local-exec" {
    command = <<EOT
      for i in $(seq 1 10); do
        INGRESS_IP=$(kubectl get ingress cloud-cost-ingress -n default -o jsonpath='{.status.loadBalancer.ingress[0].ip}' || true)
        if [ -n "$INGRESS_IP" ]; then
          echo "Ingress IP: $INGRESS_IP"
          for j in $(seq 1 5); do
            STATUS=$(curl -s -o /dev/null -w "%%{http_code}" "http://$INGRESS_IP/")
            if [ "$STATUS" = "200" ]; then
              echo $STATUS > frontend_status.txt
              exit 0
            fi
            echo "Frontend health check attempt $j failed (HTTP $STATUS), retrying in 20s..."
            sleep 20
          done
          echo "000" > frontend_status.txt
          exit 1
        fi
        echo "Ingress IP not ready, retrying in 30s..."
        sleep 30
      done
      echo "000" > frontend_status.txt
      exit 1
    EOT
    interpreter = ["/bin/bash", "-c"]
  }
}
