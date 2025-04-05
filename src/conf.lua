local IS_DEBUG = os.getenv("LOCAL_LUA_DEBUGGER_VSCODE") == "1" and arg[2] == "debug"

if IS_DEBUG then
  require("lldebugger").start()

  function love.errorhandler(msg)
    error(msg, 2)
  end
end
