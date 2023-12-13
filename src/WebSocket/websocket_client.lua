local socket = require("socket")

local client = socket.tcp()
client:connect("127.0.0.1", 8080)

while true do
  io.write("Digite uma mensagem para enviar ('exit' para sair): ")
  local message = io.read()

  if message == "exit" then
    break
  end

  client:send(message .. "\n")

  local response, err = client:receive()
  if not err then
    print("Resposta do servidor: " .. response)
  end
end

client:close()