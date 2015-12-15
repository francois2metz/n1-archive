_ = require 'underscore'
{
 Actions,
 CategoryStore,
 DOMUtils,
 DraftStore,
 FocusedMailViewStore,
 React,
 TaskFactory,
 Utils
} = require 'nylas-exports'
{RetinaImg} = require 'nylas-component-kit'

class ArchiveButton extends React.Component
  @displayName: 'ArchiveButton'
  @containerRequired: false

  @propTypes:
    thread: React.PropTypes.object.isRequired

  render: =>
    <button style={order:-107}
            className="btn btn-toolbar"
            title="Archive"
            onClick={@_onArchive}>
      <RetinaImg name="toolbar-archive.png" mode={RetinaImg.Mode.ContentIsMask} />
    </button>

  _onArchive: (e) =>
    return unless DOMUtils.nodeIsVisible(e.currentTarget)
    year = @props.thread.lastMessageReceivedTimestamp.getFullYear()
    category = _.findWhere(CategoryStore.getCategories(), displayName: 'Archives.'+ year)
    task = TaskFactory.taskForApplyingCategory
      threads: [@props.thread],
      fromView: FocusedMailViewStore.mailView(),
      category: category
    Actions.queueTask(task)
    Actions.popSheet()
    e.stopPropagation()

module.exports = ArchiveButton
