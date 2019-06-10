function textileQuickReference(textarea) {
    if (!document.createElement) { return; }
    if (!textarea) { return; }

    var div = document.createElement('div');
    div.className = 'textile-quick-reference';
    div.innerHTML = '<i>Quick Reference:</i> ' +
        '<span class="nowrap"><b>Überschriften:</b> h1. h2. h3.,</span> ' +
        '<span class="nowrap"><b>Aufzählung (Spiegelstrich):</b> * ** ***,</span> ' +
        '<span class="nowrap"><b>Aufzählung (numeriert):</b> # ## ###</span>';
    textarea.parentNode.append(div);
}
