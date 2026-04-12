USE ensembl_local;
SELECT COUNT(*) FROM gene;

SELECT COUNT(*) FROM transcript;

SELECT gene_id, COUNT(*) AS transcript_count
FROM transcript
GROUP BY gene_id
LIMIT 10;

SELECT g.stable_id, COUNT(t.transcript_id) AS transcript_count
FROM gene g
JOIN transcript t ON g.gene_id = t.gene_id
GROUP BY g.gene_id
LIMIT 10;

SELECT COUNT(DISTINCT biotype) AS unique_gene_biotypes
FROM gene;

SELECT COUNT(DISTINCT biotype) AS unique_transcript_biotypes
FROM transcript;

SELECT biotype, COUNT(*) AS gene_count
FROM gene
GROUP BY biotype
ORDER BY gene_count DESC;

SELECT seq_region_name AS chromosome, COUNT(*) AS gene_count
FROM gene
GROUP BY seq_region_name
ORDER BY gene_count DESC;


SELECT seq_region_name AS chromosome, biotype, COUNT(*) AS gene_count
FROM gene
GROUP BY seq_region_name, biotype
ORDER BY seq_region_name, gene_count DESC;