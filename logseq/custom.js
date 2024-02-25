// see https://gist.github.com/robinsonkwame/c64d43362ac8f5131e2ef12221e7df3f.js

const getBlock = async (selectedText) => {
    const currentBlock = logseq.api.get_current_block();
    if (currentBlock) {
      const newText = `[${selectedText}](())`
      const updatedContent = currentBlock.content.replace(
        selectedText, newText
      );
      await logseq.api.update_block(
        currentBlock.uuid,
        updatedContent
      ); // seems to insert a block id
  
      return updatedContent.indexOf(newText) + newText.length - 2 // for ))'s
    }
  }
  
  const adjustCaret = (offset) => {
    const selection = window.getSelection();
  
    const textArea = selection.anchorNode.firstChild
    textArea.focus()
    textArea.selectionEnd = offset
  }
  
  document.addEventListener('keydown', async (event) => {
    if (event.metaKey && event.key === 't') { // CMD + T to fire the script; select content first
  
      const selectionObject = document.getSelection();
      const selectionText = selectionObject.toString();
      if (selectionText) {
          console.log("Selected text surrounded by brackets:", selectionText);
          const offset = await getBlock(selectionText);
          adjustCaret(offset);
      }
    }
  });