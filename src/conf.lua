local IS_DEBUG = os.getenv("LOCAL_LUA_DEBUGGER_VSCODE") == "1" and arg[2] == "debug"

if IS_DEBUG then
  require("lldebugger").start()

  function love.errorhandler(msg)
    error(msg, 2)
  end
end

-- Remove this if don't want full randomness
math.randomseed(os.time())

-- Lots you can tweak here https://love2d.org/wiki/Config_Files
function love.conf(conf)
  conf.window.title = "Hello World!"
  conf.window.width = 800
  conf.window.height = 600
  conf.identity = "helloworld"

  -- Set the window position, really helpful when debugging
  if IS_DEBUG then
    conf.window.x = 20
    conf.window.y = 40
  end
end
