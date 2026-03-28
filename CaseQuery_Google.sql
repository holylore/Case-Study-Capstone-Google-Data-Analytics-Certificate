SELECT 
  EXTRACT(MONTH FROM started_at) AS mese, 
  COUNT(*) AS numero_corse
FROM `sharp-theory-489817-t3.CaseStudy_Google.CaseStudy_Google`
GROUP BY mese
ORDER BY mese;