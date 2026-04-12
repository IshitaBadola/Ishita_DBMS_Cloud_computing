window.onload = function() {

    // Gene details form
    document.getElementById('geneForm').onsubmit = function() {
        var gene = document.getElementById('geneName').value;
        alert("You searched for gene: " + gene);
        return true;
    }

    // Gene transcripts form
    document.getElementById('transcriptForm').onsubmit = function() {
        var gene = document.getElementById('transcriptGeneName').value;
        alert("You searched transcripts for gene: " + gene);
        return true;
    }

    // Chromosome genes form
    document.getElementById('chromosomeForm').onsubmit = function() {
        var chr = document.getElementById('chromosome').value;
        alert("You searched for genes in chromosome: " + chr);
        return true;
    }

}
