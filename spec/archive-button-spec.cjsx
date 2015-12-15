{React} = require 'nylas-exports'
ReactTestUtils = React.addons.TestUtils

ArchiveButton = require '../lib/archive-button'

describe "ArchiveButton", ->
  beforeEach ->
    @component = ReactTestUtils.renderIntoDocument(
      <MyComposerButton draftClientId="test" />
    )

  it "should render into the page", ->
    expect(@component).toBeDefined()

  it "should have a displayName", ->
    expect(ArchiveButton.displayName).toBe('ArchiveButton')
