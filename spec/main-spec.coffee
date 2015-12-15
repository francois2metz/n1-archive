{ComponentRegistry} = require 'nylas-exports'
{activate, deactivate} = require '../lib/main'

MyComposerButton = require '../lib/my-composer-button'

describe "activate", ->
  it "should register the composer button", ->
    spyOn(ComponentRegistry, 'register')
    activate()
    expect(ComponentRegistry.register).toHaveBeenCalledWith(MyComposerButton, {role: 'message:Toolbar'})

describe "deactivate", ->
  it "should unregister the composer button", ->
    spyOn(ComponentRegistry, 'unregister')
    deactivate()
    expect(ComponentRegistry.unregister).toHaveBeenCalledWith(MyComposerButton)
