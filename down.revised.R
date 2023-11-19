revigo.names <- c("term_ID","description","freqInDbPercent","abslog10pvalue","uniqueness","dispensability","representative");
revigo.data <- rbind(c("GO:0008152","metabolic process",75.387,1.3279,0.998,0.000,"metabolism"),
                     c("GO:0009056","catabolic process",4.820,9.3872,0.967,0.000,"catabolism"),
                     c("GO:0009987","cellular process",63.780,6.5229,0.996,0.000,"cellular process"),
                     c("GO:0023052","signaling",6.765,18.6021,0.991,0.000,"signaling"),
                     c("GO:0042221","response to chemical",3.071,36.3665,0.945,0.000,"response to chemical"),
                     c("GO:0023051","regulation of signaling",0.934,1.8539,0.868,0.636,"response to chemical"),
                     c("GO:0051716","cellular response to stimulus",9.561,19.6198,0.887,0.680,"response to chemical"),
                     c("GO:0035556","intracellular signal transduction",4.000,3.6383,0.732,0.630,"response to chemical"),
                     c("GO:0009725","response to hormone",0.335,11.3565,0.950,0.402,"response to chemical"),
                     c("GO:0009719","response to endogenous stimulus",0.526,15.9586,0.953,0.423,"response to chemical"),
                     c("GO:0033554","cellular response to stress",2.967,6.6383,0.900,0.527,"response to chemical"),
                     c("GO:0006950","response to stress",4.575,25.7696,0.943,0.562,"response to chemical"),
                     c("GO:0009966","regulation of signal transduction",0.857,1.8539,0.777,0.635,"response to chemical"),
                     c("GO:0044699","single-organism process",46.569,17.7696,0.995,0.000,"single-organism process"),
                     c("GO:0044703","multi-organism reproductive process",0.335,4.5229,0.975,0.000,"multi-organism reproductive process"),
                     c("GO:0050896","response to stimulus",12.210,39.2924,0.991,0.000,"response to stimulus"),
                     c("GO:0051179","localization",18.495,15.1024,0.992,0.000,"localization"),
                     c("GO:0065007","biological regulation",20.498,30.8539,0.992,0.000,"biological regulation"),
                     c("GO:0065009","regulation of molecular function",1.726,6.7696,0.878,0.000,"regulation of molecular function"),
                     c("GO:0080090","regulation of primary metabolic process",11.675,10.9208,0.753,0.665,"regulation of molecular function"),
                     c("GO:0010646","regulation of cell communication",0.929,1.8539,0.844,0.288,"regulation of molecular function"),
                     c("GO:0019222","regulation of metabolic process",11.942,11.3665,0.813,0.669,"regulation of molecular function"),
                     c("GO:0050789","regulation of biological process",19.373,24.9586,0.825,0.502,"regulation of molecular function"),
                     c("GO:0050801","ion homeostasis",0.434,1.6778,0.886,0.551,"regulation of molecular function"),
                     c("GO:0065008","regulation of biological quality",3.395,5.4685,0.867,0.339,"regulation of molecular function"),
                     c("GO:0051052","regulation of DNA metabolic process",0.245,1.3279,0.787,0.250,"regulation of molecular function"),
                     c("GO:0010817","regulation of hormone levels",0.161,2.6576,0.899,0.240,"regulation of molecular function"),
                     c("GO:0071554","cell wall organization or biogenesis",0.950,9.1308,0.950,0.000,"cell wall organization or biogenesis"),
                     c("GO:0071702","organic substance transport",4.980,16.7447,0.854,0.000,"organic substance transport"),
                     c("GO:0015031","protein transport",2.251,7.2924,0.811,0.421,"organic substance transport"),
                     c("GO:0006820","anion transport",1.956,8.3098,0.843,0.413,"organic substance transport"),
                     c("GO:0006810","transport",17.616,12.9208,0.829,0.600,"organic substance transport"),
                     c("GO:0006811","ion transport",5.344,6.7212,0.853,0.609,"organic substance transport"),
                     c("GO:0006839","mitochondrial transport",0.182,1.6778,0.895,0.307,"organic substance transport"),
                     c("GO:0000041","transition metal ion transport",0.344,3.6990,0.869,0.577,"organic substance transport"),
                     c("GO:0033036","macromolecule localization",3.030,9.5376,0.865,0.423,"organic substance transport"),
                     c("GO:0015849","organic acid transport",1.024,1.7959,0.807,0.681,"organic substance transport"),
                     c("GO:0007034","vacuolar transport",0.133,1.9208,0.898,0.297,"organic substance transport"),
                     c("GO:0072511","divalent inorganic cation transport",0.393,2.3872,0.861,0.592,"organic substance transport"),
                     c("GO:1902578","single-organism localization",5.919,5.1871,0.803,0.603,"organic substance transport"),
                     c("GO:0030001","metal ion transport",1.677,3.6990,0.841,0.691,"organic substance transport"),
                     c("GO:0015698","inorganic anion transport",0.872,5.1871,0.850,0.639,"organic substance transport"),
                     c("GO:0048193","Golgi vesicle transport",0.297,2.3665,0.890,0.324,"organic substance transport"),
                     c("GO:0051641","cellular localization",2.041,8.7212,0.871,0.399,"organic substance transport"),
                     c("GO:0051649","establishment of localization in cell",1.679,8.1739,0.821,0.401,"organic substance transport"),
                     c("GO:0071840","cellular component organization or biogenesis",8.568,20.0000,0.991,0.000,"cellular component organization or biogenesis"),
                     c("GO:0009058","biosynthetic process",31.611,6.0706,0.959,0.033,"biosynthesis"),
                     c("GO:0044248","cellular catabolic process",3.266,8.6990,0.861,0.040,"cellular catabolism"),
                     c("GO:0006996","organelle organization",3.595,8.3665,0.798,0.048,"organelle organization"),
                     c("GO:0061024","membrane organization",0.759,5.8539,0.828,0.594,"organelle organization"),
                     c("GO:0051276","chromosome organization",1.477,2.6778,0.814,0.646,"organelle organization"),
                     c("GO:0044802","single-organism membrane organization",0.678,3.3979,0.760,0.586,"organelle organization"),
                     c("GO:0010638","positive regulation of organelle organization",0.205,1.4089,0.764,0.693,"organelle organization"),
                     c("GO:0022607","cellular component assembly",2.484,4.7959,0.796,0.694,"organelle organization"),
                     c("GO:0044089","positive regulation of cellular component biogenesis",0.193,1.4089,0.784,0.469,"organelle organization"),
                     c("GO:0044085","cellular component biogenesis",4.355,7.2076,0.839,0.696,"organelle organization"),
                     c("GO:0071555","cell wall organization",0.709,5.9208,0.818,0.589,"organelle organization"),
                     c("GO:0043933","macromolecular complex subunit organization",2.371,5.4202,0.807,0.689,"organelle organization"),
                     c("GO:0009832","plant-type cell wall biogenesis",0.016,2.3872,0.861,0.674,"organelle organization"),
                     c("GO:0007005","mitochondrion organization",0.418,2.6576,0.834,0.662,"organelle organization"),
                     c("GO:0045229","external encapsulating structure organization",0.795,7.0605,0.827,0.597,"organelle organization"),
                     c("GO:0051130","positive regulation of cellular component organization",0.374,1.3372,0.754,0.672,"organelle organization"),
                     c("GO:0007154","cell communication",7.219,20.4202,0.938,0.055,"cell communication"),
                     c("GO:0043414","macromolecule methylation",1.255,5.7959,0.837,0.076,"macromolecule methylation"),
                     c("GO:0044723","single-organism carbohydrate metabolic process",2.457,1.8539,0.822,0.690,"macromolecule methylation"),
                     c("GO:0016051","carbohydrate biosynthetic process",1.079,3.4685,0.772,0.604,"macromolecule methylation"),
                     c("GO:0018205","peptidyl-lysine modification",0.355,2.8861,0.852,0.419,"macromolecule methylation"),
                     c("GO:0044260","cellular macromolecule metabolic process",34.276,1.9208,0.808,0.331,"macromolecule methylation"),
                     c("GO:0070647","protein modification by small protein conjugation or removal",0.821,1.3188,0.845,0.474,"macromolecule methylation"),
                     c("GO:0044262","cellular carbohydrate metabolic process",1.257,2.1871,0.868,0.627,"macromolecule methylation"),
                     c("GO:0031399","regulation of protein modification process",0.565,2.3098,0.756,0.439,"macromolecule methylation"),
                     c("GO:0043412","macromolecule modification",9.785,3.0362,0.883,0.168,"macromolecule methylation"),
                     c("GO:0008213","protein alkylation",0.343,1.6576,0.858,0.417,"macromolecule methylation"),
                     c("GO:0005976","polysaccharide metabolic process",0.906,4.7959,0.871,0.124,"macromolecule methylation"),
                     c("GO:0006464","cellular protein modification process",7.726,2.4559,0.797,0.642,"macromolecule methylation"),
                     c("GO:0006487","protein N-linked glycosylation",0.076,1.3279,0.798,0.363,"macromolecule methylation"),
                     c("GO:0006790","sulfur compound metabolic process",1.822,2.4685,0.917,0.080,"sulfur compound metabolism"),
                     c("GO:0032787","monocarboxylic acid metabolic process",2.485,6.4949,0.797,0.084,"monocarboxylic acid metabolism"),
                     c("GO:0072330","monocarboxylic acid biosynthetic process",0.940,4.8539,0.759,0.529,"monocarboxylic acid metabolism"),
                     c("GO:0044710","single-organism metabolic process",31.682,1.8239,0.885,0.335,"monocarboxylic acid metabolism"),
                     c("GO:0019751","polyol metabolic process",0.262,2.1249,0.876,0.332,"monocarboxylic acid metabolism"),
                     c("GO:0044763","single-organism cellular process",27.536,22.8239,0.861,0.164,"monocarboxylic acid metabolism"),
                     c("GO:0044237","cellular metabolic process",53.061,4.3098,0.899,0.169,"monocarboxylic acid metabolism"),
                     c("GO:0044255","cellular lipid metabolic process",2.704,5.7212,0.765,0.256,"monocarboxylic acid metabolism"),
                     c("GO:0009069","serine family amino acid metabolic process",0.544,1.6021,0.813,0.497,"monocarboxylic acid metabolism"),
                     c("GO:0045017","glycerolipid biosynthetic process",0.300,1.4318,0.764,0.685,"monocarboxylic acid metabolism"),
                     c("GO:0046467","membrane lipid biosynthetic process",0.317,3.0506,0.760,0.689,"monocarboxylic acid metabolism"),
                     c("GO:0046483","heterocycle metabolic process",29.664,2.1871,0.873,0.245,"monocarboxylic acid metabolism"),
                     c("GO:1901605","alpha-amino acid metabolic process",3.625,1.3372,0.768,0.638,"monocarboxylic acid metabolism"),
                     c("GO:0006694","steroid biosynthetic process",0.122,2.3098,0.786,0.626,"monocarboxylic acid metabolism"),
                     c("GO:0006721","terpenoid metabolic process",0.260,2.7212,0.804,0.675,"monocarboxylic acid metabolism"),
                     c("GO:0006725","cellular aromatic compound metabolic process",29.628,2.9586,0.873,0.176,"monocarboxylic acid metabolism"),
                     c("GO:0008202","steroid metabolic process",0.161,2.1675,0.826,0.643,"monocarboxylic acid metabolism"),
                     c("GO:0007049","cell cycle",1.885,1.3872,0.872,0.244,"monocarboxylic acid metabolism"),
                     c("GO:0006629","lipid metabolic process",3.522,4.5686,0.855,0.223,"monocarboxylic acid metabolism"),
                     c("GO:0006082","organic acid metabolic process",9.086,3.3979,0.772,0.608,"monocarboxylic acid metabolism"),
                     c("GO:0046148","pigment biosynthetic process",0.448,1.6021,0.905,0.173,"monocarboxylic acid metabolism"),
                     c("GO:0044283","small molecule biosynthetic process",5.677,5.3188,0.762,0.488,"monocarboxylic acid metabolism"),
                     c("GO:0042440","pigment metabolic process",0.485,2.4559,0.904,0.174,"monocarboxylic acid metabolism"),
                     c("GO:0090407","organophosphate biosynthetic process",4.110,2.3665,0.826,0.090,"organophosphate biosynthesis"),
                     c("GO:0032774","RNA biosynthetic process",10.925,6.0177,0.727,0.422,"organophosphate biosynthesis"),
                     c("GO:0044711","single-organism biosynthetic process",10.864,11.1079,0.803,0.291,"organophosphate biosynthesis"),
                     c("GO:0019220","regulation of phosphate metabolic process",0.579,1.8861,0.811,0.415,"organophosphate biosynthesis"),
                     c("GO:0016070","RNA metabolic process",15.951,3.8539,0.774,0.597,"organophosphate biosynthesis"),
                     c("GO:0009059","macromolecule biosynthetic process",19.548,2.6576,0.793,0.556,"organophosphate biosynthesis"),
                     c("GO:0044249","cellular biosynthetic process",30.048,5.8539,0.782,0.539,"organophosphate biosynthesis"),
                     c("GO:1901576","organic substance biosynthetic process",30.365,5.7447,0.810,0.658,"organophosphate biosynthesis"),
                     c("GO:0006139","nucleobase-containing compound metabolic process",26.547,2.2218,0.800,0.597,"organophosphate biosynthesis"),
                     c("GO:0019438","aromatic compound biosynthetic process",16.954,5.7959,0.784,0.450,"organophosphate biosynthesis"),
                     c("GO:0090304","nucleic acid metabolic process",21.449,3.4815,0.775,0.520,"organophosphate biosynthesis"),
                     c("GO:0018130","heterocycle biosynthetic process",17.388,5.4318,0.784,0.477,"organophosphate biosynthesis"),
                     c("GO:0044281","small molecule metabolic process",15.138,3.7959,0.856,0.382,"organophosphate biosynthesis"),
                     c("GO:1901362","organic cyclic compound biosynthetic process",17.871,6.5850,0.804,0.400,"organophosphate biosynthesis"),
                     c("GO:1901360","organic cyclic compound metabolic process",30.324,3.5528,0.909,0.102,"organophosphate biosynthesis"),
                     c("GO:0051174","regulation of phosphorus metabolic process",0.580,1.8861,0.811,0.415,"organophosphate biosynthesis"),
                     c("GO:0034645","cellular macromolecule biosynthetic process",19.291,2.4949,0.736,0.680,"organophosphate biosynthesis"));

stuff <- data.frame(revigo.data);
names(stuff) <- revigo.names;

# Convert character columns to numeric where necessary
stuff$abslog10pvalue <- as.numeric(as.character(stuff$abslog10pvalue))
stuff$freqInDbPercent <- as.numeric(as.character(stuff$freqInDbPercent))
stuff$uniqueness <- as.numeric(as.character(stuff$uniqueness))
stuff$dispensability <- as.numeric(as.character(stuff$dispensability))

# Filter the data to only include the specified GO terms
#selected_terms <- c("anatomical structure development", "reproduction", "response to stimulus", 
#                    "biological regulation", "transport", "establishment of localization", 
#                    "localization", "cellular metabolic process")
#stuff.filtered <- stuff[stuff$description %in% selected_terms, ]
stuff.filtered <- subset(stuff, abslog10pvalue >= 8)

# Output to a PDF file
pdf(file = "revigo_treemap_filtered.pdf", width = 16, height = 9) # Adjust the size as needed

# Create the treemap
tmPlot(
  stuff.filtered,
  index = c("representative", "description"),
  vSize = "abslog10pvalue",
  type = "categorical",
  vColor = "representative",
  title = "REVIGO Gene Ontology treemap (Filtered)",
  inflate.labels = FALSE, # Set this to TRUE for space-filling group labels - good for posters
  lowerbound.cex.labels = 0, # Try to draw as many labels as possible
  bg.labels = "#CCCCCCAA", # Semi-transparent grey for label background
  position.legend = "none"
)

# Close the PDF device
dev.off()
