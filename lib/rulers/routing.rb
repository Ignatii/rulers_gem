module Rulers
  class Application
    def get_controller_and_action(env)
      _, cont, action, after = env["PATH_INFO"].split('/', 4)
      _, cont, action, after =[nil, 'quotes', 'a_quote', nil] if env["PATH_INFO"] == '/'
      cont = cont.capitalize # "People"
      cont += "Controller" # "PeopleController"
      [Object.const_get(cont), action]
    end
  end
end