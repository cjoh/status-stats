StatusStats = require '../lib/status-stats'
{$} = require "atom-space-pen-views"

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "StatusStats", ->
  workspaceElement = null
  activationPromise = null

  beforeEach ->
    workspaceElement = atom.views.getView(atom.workspace)

  describe "when the status-stats:toggle event is triggered", ->
    it "attaches and then detaches the view", ->
      # SMELL Assumes that the plugin is not enabled by default,
      # which might not always be the case
      # So, how do we ensure that the plugin is not enabled?
      expect($(workspaceElement).find('.status-stats')).not.toExist()

      atom.commands.dispatch workspaceElement, 'status-stats:toggle'

      waitsForPromise ->
        atom.packages.activatePackage('StatusStats')

      runs ->
        expect($(workspaceElement).find('.status-stats')).toExist()
        atom.commands.dispatch workspaceElement, 'status-stats:toggle'
        expect($(workspaceElement).find('.status-stats')).not.toExist()
