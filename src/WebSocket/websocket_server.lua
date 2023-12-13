local socket = require("socket")

local server = socket.bind("*", 8080)
print("Servidor WebSocket iniciado na porta 8080")

local client = server:accept()

while true do
  -- Recebe mensagem do cliente
  local line, err = client:receive()
  if not err then
    print("Mensagem recebida do cliente: " .. line)

    -- Envio de resposta para o cliente
    client:send("Mensagem recebida: " .. line .. "\n")

    -- Envio de mensagem para o cliente
    local message_to_send = "Mensagem do servidor para o cliente"
    client:send(message_to_send .. "\n")
    print("Mensagem enviada para o cliente: " .. message_to_send)
  end
end