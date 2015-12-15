{ComponentRegistry} = require 'nylas-exports'
{activate, deactivate} = require '../lib/main'

ArchiveButton = require '../lib/archive-button'

describe "activate", ->
  it "should register the button", ->
    spyOn(ComponentRegistry, 'register')
    activate()
    expect(ComponentRegistry.register).toHaveBeenCalledWith(ArchiveButton, {role: 'message:Toolbar'})

describe "deactivate", ->
  it "should unregister the button", ->
    spyOn(ComponentRegistry, 'unregister')
    deactivate()
    expect(ComponentRegistry.unregister).toHaveBeenCalledWith(ArchiveButton)
