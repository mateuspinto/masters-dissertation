# Figure Descriptions

Plain-language descriptions of every figure that actually appears in the compiled dissertation (`main_paper.tex`). This file exists so a text-only consumer (e.g. an LLM ingesting the LLM-friendly version of the dissertation from the repo's releases) can "see" what each figure shows without the binary image/PDF.

Each entry lists the figure's path (relative to the repo root), its caption as written in the dissertation, and a description grounded in the actual image content.

---

## Chapter 1 — Introduction

### `figures/1_introduction/pastis-sits.png`
**Caption (from dissertation):** Example of a Satellite Image Time Series (SITS) from Sentinel 2 with a labeling process.
**Description:** The image has two panels connected by an arrow. On the left, a stack of roughly nine overlapping Sentinel-2 optical patches of the same agricultural field over time (a satellite image time series), showing subtle seasonal changes in crop color and field boundaries across acquisition dates. On the right, the single top-most image of that stack is shown fully labeled: parcel boundaries are outlined in thin colored lines and each parcel is filled with a distinct color/hue corresponding to its crop class, with a legend at the bottom listing six classes — Meadow (light blue), Winter barley (green), Spring barley (red), Soft winter wheat (orange), Winter rapeseed (light green), and Beet (purple). The figure illustrates how a raw multi-temporal satellite image stack is converted into a per-parcel crop-type label map, adapted from the PASTIS dataset.

### `figures/1_introduction/graphical_abstract_crop_new_fixed.pdf`
**Caption (from dissertation):** Diagram showing possible agricultural (a) and correlated (b) applications with Deep Learning and Remote Sensing. Panel (a) illustrates a large-scale crop monitoring pipeline based on (1) parcel delineation, (2) crop mapping and (3) crop yielding prediction over multitemporal images.
**Description:** A 2x2 diagram illustrating a three-step agricultural monitoring pipeline built on a time series (T) of circular center-pivot-irrigation farm fields seen from above. Top-left shows the stacked multitemporal satellite image input. An arrow leads right to step 1, "Parcel Delineation," where the same image has each circular field outlined in yellow. From there, an arrow leads down to step 2, "Crop Mapping," where each delineated parcel is now annotated with a crop-specific icon (corn, soybean, sunflower, coffee beans, etc.) indicating the classified crop type. A separate arrow from the original stacked image leads to step 3, "Crop Yielding," shown as a bar chart with four bars (colored cream, light green, orange, brown) under icons for corn, soybean, sunflower, and coffee, representing predicted yield per crop. Numbered circles (1, 2, 3) label each step, showing the pipeline flows from raw multitemporal imagery to delineated parcels, to per-parcel crop classification, to yield prediction.

### `figures/1_introduction/graphical_abstract_lulc_cd_new.pdf`
**Caption (from dissertation):** Diagram showing possible agricultural (a) and correlated (b) applications with Deep Learning and Remote Sensing. Panel (b): two timestamps t0 and t1 are used to compute land cover/usage and change detection.
**Description:** A diagram with two labeled satellite image tiles on the left, "SITS t0" (top) and "SITS t1" (bottom), both false-color (vegetation appears reddish/pink, consistent with near-infrared composites) showing a forested area with a large light-colored cleared patch and a thin road/trail cutting through it. An arrow from the t0 image points right to a "Land Use/Cover" panel: the same scene reduced to flat color-coded land-cover classes (green for forest, tan/beige for cleared/bare land, teal for water, plus a small transitional-class patch). An arrow from the t1 image points right to a "Change Detection" panel: a black background with the cleared/changed area highlighted solid red, isolating exactly the region that changed between the two timestamps. Together the two rows show how comparing SITS from two dates yields both a land-cover classification map and a binary deforestation/change mask.

---

## Chapter 2 — Theoretical Background

### Agricultural Remote Sensing

#### `figures/3_theoretical_background/veg_reflectance.jpg`
**Caption (from dissertation):** Example of spectral behavior of different crops classes.
**Description:** A line chart plotting reflectance factor (y-axis, 0 to 0.75) against wavelength in nanometers (x-axis, ~400–2600 nm) for six crops: corn (light green), sugarcane (blue), coffee (purple), canola (red/salmon), wheat (teal), and tobacco (dark green/black). The background is divided into three shaded regions labeled "VIS Pigments" (~400–750 nm), "NIR Structure" (~750–1350 nm), and "SWIR Water-structure" (~1350–2600 nm). Wheat (teal) stands out with a much higher reflectance curve than the other five crops across almost the entire spectrum, especially in the NIR plateau (~0.70); the other five crops cluster more closely together, roughly 0.40–0.55 in the NIR region. All curves share a similar shape: low reflectance in the visible range with a small "green peak," a sharp rise at the red-edge into a high NIR plateau, then two absorption dips in the SWIR region. A gray box reports an ANOVA-style statistic "F: 45,657.4, p < 0.001" indicating the differences between crops are statistically significant.

### Machine Learning in Remote Sensing — Shallow Learning

#### `figures/3_theoretical_background/shallow_learning/traditional_programming_pipeline.pdf`
**Caption (from dissertation):** Visual comparison between Classical Programming and Machine Learning. (a) Classical Programming paradigm.
**Description:** A simple flow diagram with two input boxes, "Data" (orange) and "Program" (dark gray), both feeding into a black circular "Computer" icon, which outputs to a blue "Output" box — the classical paradigm where a human-written program plus data produce an output.

#### `figures/3_theoretical_background/shallow_learning/machine_learning_pipeline.pdf`
**Caption (from dissertation):** Visual comparison between Classical Programming and Machine Learning. (b) Machine Learning paradigm.
**Description:** The same layout as the classical-programming diagram but with roles swapped: "Data" (orange) and "Output" (blue) are now the two inputs feeding into the "Computer" icon, which produces "Program" (gray) as the output — the computer infers the program (model) from examples of data and their outputs, rather than being given the program explicitly.

#### `figures/3_theoretical_background/shallow_learning/knn.pdf`
**Caption (from dissertation):** Diagram of a K-nearest neighbor model.
**Description:** A 2D scatter plot ("Feature 1" vs "Feature 2") showing two clusters of labeled points — blue squares (bottom-left) and green circles (top-right) — plus one red X marking an unlabeled query point near the blue-square cluster. Two thin lines connect the X to its two nearest blue-square neighbors, illustrating K=2 nearest-neighbor voting classifying the point as blue.

#### `figures/3_theoretical_background/shallow_learning/svm.pdf`
**Caption (from dissertation):** Diagram of a Support Vector Machine model.
**Description:** A 2D scatter plot with the same two clusters as the KNN figure, separated by a solid diagonal decision boundary flanked by two parallel dashed margin lines through the closest points of each class (the support vectors). An arrow labeled "2/‖ω‖" indicates the margin width, illustrating that SVM finds the hyperplane maximizing this margin between classes.

#### `figures/3_theoretical_background/shallow_learning/random_forest.pdf`
**Caption (from dissertation):** Diagram of a Random Forest model.
**Description:** A "Dataset" box branches into three independent decision trees, each a small binary tree of colored nodes with a highlighted root-to-leaf path. Each tree outputs its own classification ("BLUE", "GREEN", "GREEN"), which feed into a "Majority Voting / Averaging" box that combines them into the final ensemble prediction "GREEN".

#### `figures/3_theoretical_background/shallow_learning/gradient_boosting.pdf`
**Caption (from dissertation):** Diagram of a Gradient Boosting (GB) model.
**Description:** Similar layout to the Random Forest figure — a "Dataset" box feeding three decision trees — but the trees are shown in decreasing color intensity and curved arrows link Tree-1's output forward into Tree-2 and Tree-2's into Tree-3. The trees feed into an "Additive Combination" box (rather than majority voting), illustrating that each subsequent tree corrects the residual errors of the previous ones and their outputs are summed.

#### `figures/3_theoretical_background/shallow_learning/kmeans.pdf`
**Caption (from dissertation):** The impact of applying K-Means in a Unlabeled Dataset.
**Description:** Two side-by-side scatter plots. "Before K-Means" shows undifferentiated gray dots forming two visually separable groups with no labels. "After K-Means" shows the same points colored and circled into two distinct groups — "Unknown Class 1" and "Unknown Class 2" — illustrating how K-Means partitions an unlabeled dataset without prior class labels.

#### `figures/3_theoretical_background/shallow_learning/gmm.pdf`
**Caption (from dissertation):** Diagram of a Gaussian Mixture Model.
**Description:** A 2D scatter plot showing three overlapping clusters of differently marked points, each surrounded by nested elliptical contour bands representing fitted Gaussian probability-density contours. The overlap between two of the ellipses visually demonstrates GMM's soft-clustering behavior, where points in the overlap region have nontrivial probability of belonging to either component (unlike K-Means' hard boundaries).

### Machine Learning in Remote Sensing — Deep Learning

#### `figures/3_theoretical_background/deep learning/mlp.pdf`
**Caption (from dissertation):** Diagram of a Multi-Layer Perceptron.
**Description:** A classic feedforward network: three input nodes ("Feature 1/2/3") fully connected to a hidden layer of four neurons, connected to a second hidden layer of four neurons, converging into a single output neuron that produces "Result: GREEN".

#### `figures/3_theoretical_background/deep learning/cnn.pdf`
**Caption (from dissertation):** Diagram of a Convolutional Neural Network.
**Description:** Starts with an aerial/satellite image of agricultural parcels; a small patch is highlighted and connected via dashed lines to a stack of orange feature maps (sliding-window convolution), reduced further, then fed into a teal "Pooling (max/avg)" block, then a fully-connected "MLP" block, finally producing "Result: Flower / Farmland" — the classic CNN pipeline of convolution, pooling, and MLP classification head.

#### `figures/3_theoretical_background/deep learning/cnn_history.pdf`
**Caption (from dissertation):** Historical diagram of the evolution of Convolutional Neural Networks.
**Description:** A horizontal timeline (1989–2025) of CNN architecture milestones as colored boxes on a timeline: ConvNet (1989), LeNet (1998), AlexNet/GoogleNet (2012), VGG/Inception V2-4 (2014), ResNet (2015), DenseNet (2016), Squeeze-and-Excitation/ResNeXt (2017), Channel-Boosted CNN/MobileNet V1-4 (2018), EfficientNet V1-2 (2019), ConvNeXt V1-2 (2022), E-ConvNeXt (2025) — tracing the lineage of major CNN families over three decades.

#### `figures/3_theoretical_background/deep learning/fcn.pdf`
**Caption (from dissertation):** Diagram of a Fully Convolutional Network model.
**Description:** An input aerial image flows through a sequence of shrinking orange 3D feature-map blocks (downsampling encoder), connecting to two output slabs: "pixelwise prediction" and "segmentation g.t." (a color-coded land-cover map) — illustrating FCN transforming an image directly into a dense, pixel-wise segmentation output compared to ground truth.

#### `figures/3_theoretical_background/deep learning/unet.pdf`
**Caption (from dissertation):** Diagram of a U-Net model.
**Description:** The classic U-Net "U" shape: a left (encoder) path narrowing through convolution blocks connected by "max-pool 2x2" downsampling, turning at the bottom into a right (decoder) path widening via "transposed conv 2x2" upsampling, with horizontal "concatenate" skip connections linking each encoder level to its corresponding decoder level. A legend defines conv/pooling/concatenation arrow colors.

#### `figures/3_theoretical_background/deep learning/rnn.pdf`
**Caption (from dissertation):** Diagram of a Recurrent Neural Network model.
**Description:** Left side shows the compact "rolled" RNN cell: input "x" feeding via weight "U" into hidden state "h" (with a self-loop "V") producing output "y" via "W". An "Unfold" arrow shows the same cell unrolled across three timesteps, chained via "V", visually explaining recurrence as a chain of repeated cells over time.

#### `figures/3_theoretical_background/deep learning/lstm.pdf`
**Caption (from dissertation):** Diagram of a Long Short-Term Memory model.
**Description:** The classic LSTM memory-cell internal diagram. Previous cell/hidden states enter from the left; three gate blocks (two sigmoid, one tanh) produce forget/input/candidate activations combining via multiply/add nodes to update the cell state; an output-gate sigmoid combines with a tanh of the new cell state to produce the new hidden state — the standard gated mechanism letting LSTMs selectively retain or forget information over long sequences.

#### `figures/3_theoretical_background/deep learning/gan.pdf`
**Caption (from dissertation):** Diagram of a Generative Adversarial Network model.
**Description:** Two parallel paths feed a "Discriminator" block: a "Real images" path with a real aerial farmland photo, and a "Random input" → "Generator" path producing a synthetic agricultural image. Both point into the Discriminator, whose output splits into "Discriminator loss" and "Generator loss," with a "Backpropagation" arrow looping back — the standard adversarial training loop.

#### `figures/3_theoretical_background/deep learning/autoencoder.pdf`
**Caption (from dissertation):** Diagram of a AutoEncoder model.
**Description:** A satellite/aerial parcel image ("Input x") flows into a trapezoid "Encoder" narrowing to a small bottleneck vector "f", then expands through a mirrored "Decoder" back to a "Reconstruction x" visually identical to the input — the core autoencoder principle of compressing then reconstructing.

#### `figures/3_theoretical_background/deep learning/transformer.pdf`
**Caption (from dissertation):** Diagram of a Transformer model.
**Description:** The standard encoder-decoder Transformer diagram. The encoder stack (repeated n×) embeds "Sources," adds positional encoding, and applies multi-head attention, add&norm, and a positionwise MLP. The decoder stack similarly embeds "Targets," applies masked multi-head attention, a second (cross-)attention that also receives the encoder output, and a positionwise MLP, ending in an output MLP — the canonical self-attention architecture from "Attention Is All You Need."

#### `figures/3_theoretical_background/deep learning/bert.pdf`
**Caption (from dissertation):** Diagram of a Bidirectional Encoder Representations from Transformers model.
**Description:** Shows a pipeline for the input sentence "May the force be" (one word per box) feeding into a "BERT encoder" block (annotated "context aware through 'self-attention'"), producing per-token embedding vectors, then a "Category specific layer," and a final output row coloring each token by predicted part-of-speech (Verb, Article, Noun, Verb) — illustrating BERT's bidirectional, context-aware token classification.

#### `figures/3_theoretical_background/deep learning/vit.pdf`
**Caption (from dissertation):** Diagram of a Vision Transformer model.
**Description:** An input image split into a 3×3 grid of small patches, each flattened and fed with a learned `<cls>` token into a "Patch Embedding" + "Positional embedding" layer. The sequence passes through a repeated Transformer encoder block (Norm, multi-head attention, residual, Norm, MLP, residual), and the class-token representation is passed through a final Norm+MLP to produce the classification result — illustrating ViT treating an image as a sequence of patches processed by a standard Transformer encoder.

#### `figures/3_theoretical_background/deep learning/mamba.pdf`
**Caption (from dissertation):** Diagram of a Mamba model.
**Description:** A "Mamba Block" processing a tokenized sentence. The signal passes through RMS Norm, splits into two parallel projection branches (one through Convolution + Silu into a "Selective SSM" state-space block, the other through its own projection + Silu), combined via multiplication, followed by another projection, a skip-connection addition, a second RMS Norm, and a final Linear+Softmax layer producing the predicted next token — illustrating Mamba's selective state-space mechanism as an alternative to attention.

### Self-Supervised Learning in Remote Sensing

#### `figures/3_theoretical_background/ssl/representation_learning_pre-training.pdf`
**Caption (from dissertation):** Overview of the self-supervised pretraining and finetuning process (panel a — pretraining).
**Description:** An agricultural image **x** is transformed by a sampled transform τ into an augmented **x̂**. Both feed through backbone encoder *f* to produce feature vector **f**, then through a small projection head *h_p* to output **o_p**, which together with **x** feeds a pretraining loss ℒ_p — the generic self-supervised pretraining loop of augment, encode, project, compute a pretext loss.

#### `figures/3_theoretical_background/ssl/representation_learning_finetuning.pdf`
**Caption (from dissertation):** Overview of the self-supervised pretraining and finetuning process (panel b — finetuning).
**Description:** An image **x** feeds the same backbone *f*, producing feature vector **f**, then a new head *h_t* producing output **o_t**. A ground-truth labeled parcel map **y** feeds a loss ℒ_t together with **o_t** — illustrating fine-tuning: the pretrained backbone is reused but the pretraining head is replaced by a new one trained against real labels.

#### `figures/3_theoretical_background/ssl/transform_prediction.pdf`
**Caption (from dissertation):** Overview of transform prediction self-supervised learning.
**Description:** An image **x** is transformed by a sampled τ into **x̂**, passed through backbone *f* and head *h* to predict the applied transform **τ̃**. The true τ and predicted **τ̃** feed a loss ℒ — the pretext task of predicting which transformation was applied.

#### `figures/3_theoretical_background/ssl/similarity.pdf`
**Caption (from dissertation):** Overview of similarity self-supervised pretraining.
**Description:** A symmetric two-branch diagram: a source image **x** is transformed via two independently sampled transforms into two augmented views, each passed independently through the same backbone *f* and a projection head *h*, and both projections feed a similarity loss ℒ_sim that pulls them together — enforcing agreement between two augmented views of the same image.

#### `figures/3_theoretical_background/ssl/masked_image_modeling.pdf`
**Caption (from dissertation):** Overview of masked image self-supervised pretraining.
**Description:** An image **x** is cut into a patch grid; a subset of patches is masked. Only the visible patches are linearized and fed through encoder *f* to get encoded tokens, combined with placeholder tokens for the masked patches, then passed through decoder *g* to reconstruct the masked patches — compared against the real masked patches via a reconstruction loss ℒ_rec. The classic masked-autoencoder-style pretext task.

#### `figures/3_theoretical_background/ssl/masked_image_modeling_similarity.pdf`
**Caption (from dissertation):** Overview of masked image similarity self-supervised pretraining.
**Description:** A two-branch diagram combining masking with similarity-based SSL: a source image is masked twice with two different random masks; each masked view passes through the shared backbone to yield encoded tokens, which branch into (1) a projection head feeding a similarity loss ℒ_sim between the two views, and (2) a decoder reconstructing the full patch grid, feeding a reconstruction loss ℒ_rec — a hybrid pretext task combining similarity and reconstruction.

### Confidence Estimation

#### `figures/3_theoretical_background/gemos.jpg`
**Caption (from dissertation):** Comparison between closed set and open set classification.
**Description:** Three panels — (a) Dataset, (b) Closed set space, (c) Open set space — showing the same scatter of colored shapes (three known classes plus one red "?" unknown sample). In (b), straight-line partitions cover the whole plane, forcing the "?" sample into an existing class (misclassification). In (c), each class is instead enclosed by its own tight boundary, leaving the "?" sample outside all of them, correctly left unassigned — contrasting closed-set classification (always forces a decision) with open-set recognition (can flag novel/unknown samples).

---

## Chapter 3 — Related Work

#### `figures/4_related_works/taxonomy/count_published_papers.pdf`
**Caption (from dissertation):** Diagram for papers and their publishers.
**Description:** A bar chart of number of papers returned per database: ACM 41, IEEE 251, PubMed 73, Scopus 508 (the tallest), arXiv 30 — Scopus returned by far the most candidate papers in the literature search, followed by IEEE.

#### `figures/4_related_works/taxonomy/papers_per_year.pdf`
**Caption (from dissertation):** Number of published papers per year.
**Description:** A line/scatter chart of paper counts by year (2019–2024): 12, 23, 55, 103, 136, then a sharp jump to 574 in 2024 — showing strong, accelerating year-over-year growth, especially in the final year.

#### `figures/4_related_works/taxonomy/cumulative_approaches.pdf`
**Caption (from dissertation):** Cumulative approach of used approaches over the years.
**Description:** A stacked-area chart ("Cumulative Use of Transformers Over the Years") with four stacked layers — Self-supervised Learning, Convolutional Networks, Attention Mechanism, Transformer Networks — all near zero until ~2022 then growing steadily, with a sharp increase in 2024 reaching a stacked total of ~550 papers; Convolutional Networks and Attention Mechanism contribute the largest 2024 shares.

#### `figures/4_related_works/taxonomy/venn_diagram_application.pdf`
**Caption (from dissertation):** Venn diagram for applications for selected papers.
**Description:** A five-set Venn diagram (LULC, Crop Yield, Change Detection, Crop Mapping, Parcel Delineation) with paper counts in every region. Exclusive counts dominate each set (Change Detection 142, Crop Mapping 135, LULC 89, Crop Yield 22, Parcel Delineation 29), while intersections are comparatively small and only one paper touches all five — showing these application areas are mostly studied in isolation in the literature.

#### `figures/4_related_works/taxonomy/taxonomy.pdf`
**Caption (from dissertation):** Proposed taxonomy for Deep Learning Remote Sensing related works.
**Description:** A top-down taxonomy tree: root "Agriculture RS" branches into five categories (Parcel Delineation, Crop Mapping, Crop Yielding, LULC, Change Detection), each further split into colored method-type boxes (Convolutional, Multi-Task, SSL, Shallow, Transformer, LSTM, Generative, Other, as applicable per category), with dotted lines leading to lists of citation markers for the specific papers classified under each combination — the full taxonomy used to organize the entire literature review.

---

## Chapter 4 — Methodology: Datasets

### Data acquisition pipeline

#### `figures/6_methodology/creating_datasets.pdf`
**Caption (from dissertation):** Graphical abstract showing the pipeline for creating parcel-level crop classification dataset.
**Description:** A "LABEL ACQUISITION" flow: a "Cropland Raster" image and a "Parcels Delineation" image feed into a "GEE CLOUD" box that combines them into a parcel raster plus a vegetation-index summary table (columns: Geom, Class, %, Max EVI2, STD EVI2), with rows color-coded green (kept, high confidence) or red (filtered out, low confidence). An arrow leads to a final satellite image showing only the accepted, color-coded high-confidence parcels — the full pipeline from raw cropland raster + parcel boundaries to a filtered, labeled, per-parcel crop dataset.

#### `figures/6_methodology/ligthweight_dowload.pdf`
**Caption (from dissertation):** Graphical abstract showing the Lightweight SITS download strategy.
**Description:** A "SITS ACQUISITION" flow: a field-boundary polygon plus start/end dates feed a "GEE CLOUD" box listing four steps (collect intersecting images, crop by geometry, mask clouds, spatially aggregate). This produces a noisy, jagged "RAW SITS" chart, which becomes — after treatment — a smooth "TREATED RES. SITS" chart with two clear seasonal peaks and evenly spaced points, contrasting raw vs. cleaned time series.

#### `figures/6_methodology/mapbiomas.png`
**Caption (from dissertation):** The Mapbiomas 2023 Cropland Raster classification for the city of Luís Eduardo Magalhães, Bahia.
**Description:** A land-cover classification map over a real agricultural region, color-coded by a legend of agriculture/livestock sub-categories (pasture, temporary crops like soy/sugarcane/rice/cotton, perennial crops like coffee/citrus/palm oil, forestry, mixed-use mosaic). Shows a large expanse of pink cropland fields, a small red urban cluster, circular pivot-irrigation fields, and a blue river — illustrating the coarse, single-crop-family granularity of the public MapBiomas raster.

#### `figures/6_methodology/USDA.png`
**Caption (from dissertation):** The USDA Cropland Raster.
**Description:** A choropleth map of the continental United States (USDA NASS Cropland Data Layer) with per-crop classes (corn, soybeans, wheat, cotton, rice, etc.) and non-agriculture classes (woodland, urban, water, etc.). Shows a clear geographic pattern: a yellow/gold corn-soybean belt across the Midwest, green woodland in the East, tan shrubland/pasture in the West, a red cotton cluster in Texas/Oklahoma and the Mississippi Delta — illustrating the finer per-crop-species granularity of the USDA raster compared to MapBiomas.

### Varda Global FieldID parcel dataset

#### `figures/6_methodology/varda/varda_lem.png`
**Caption (from dissertation):** VARDA plots in the municipality of Luís Eduardo Magalhães, Bahia - Brazil.
**Description:** A satellite image overlaid with red polygon outlines marking individual VARDA-delineated field parcels — mostly irregular quadrilaterals following field boundaries, plus a large cluster of perfectly circular parcels (center-pivot irrigation) in the right-central and lower-right portions.

#### `figures/6_methodology/varda/varda_quarai.png`
**Caption (from dissertation):** VARDA plots in the municipality of Barra do Quaraí, Rio Grande do Sul - Brazil.
**Description:** A satellite image of a floodplain/lowland agricultural area near the Brazil–Uruguay border. Red polygon outlines cover a very dense, irregular patchwork of small, oddly-shaped parcels typical of rice-paddy/lowland fields, contrasting with more regular grid-like parcels seen elsewhere.

#### `figures/6_methodology/varda/varda_fresno.png`
**Caption (from dissertation):** VARDA plots in the municipality of Fresno, California - USA.
**Description:** A satellite image near Fresno, California, with red polygon outlines. Parcels are predominantly regular, rectangular grid-like fields typical of U.S. industrial agriculture, contrasting with the more irregular shapes seen in the Brazilian examples.

#### `figures/6_methodology/varda/varda_erros.jpg`
**Caption (from dissertation):** Agricultural plots mistakenly identified in the water in Lagoa dos Patos, in the extreme south of Brazil, on the border between Brazil and Uruguay.
**Description:** A satellite image of a large body of water near the Brazil–Uruguay border, overlaid with rows of small dashed/dotted white square markers arranged in an artificial grid pattern spanning much of the lake — these are VARDA parcel polygons erroneously delineated inside open water, demonstrating a systematic false-positive error of the delineation model when it misinterprets water texture as farmland.

#### `figures/6_methodology/varda/varda_samples_per_uf.png`
**Caption (from dissertation):** Number of VARDA parcels in thousands per state in Brazil.
**Description:** A choropleth map of Brazil's states shaded by parcel count (in thousands). Minas Gerais has the highest value (6,917k), followed by São Paulo (5,424k) and other Southeast/South states; Northern Amazonian states show much lower counts — parcel density is concentrated in the South/Southeast/central agricultural belt, sparse in the Amazon.

### Generated SITS datasets (Brazil, California, Texas)

#### `figures/6_methodology/datasets/brazil_bar_crop.pdf`
**Caption (from dissertation):** Crop classes distribution in Brazil SITS dataset.
**Description:** A bar chart of 10 crop classes by sample count. Pasture dominates (26,242), followed by Other Temporary Crops (16,546) and Soybean (16,511); Palm Oil is the smallest class (1,493) — showing strong class imbalance, Pasture roughly 18x larger than Palm Oil.

#### `figures/6_methodology/datasets/brazil_evi2.pdf`
**Caption (from dissertation):** EVI2 per crop class in Brazil SITS dataset.
**Description:** A grid of 10 small-multiple EVI2 time-series panels (one per class) over the Brazilian crop year. Soybean shows a clear single seasonal peak; Rice shows a broad plateau with an unusual secondary bump (double-cropping/"safrinha" noise); Pasture, Forest Plantation, and perennial classes show flat, noisy, high-variance bands with no strong seasonal peak. Curves are visually noisier than the US datasets, consistent with more label noise inherited from Mapbiomas.

#### `figures/6_methodology/datasets/brazil_map_crops.pdf`
**Caption (from dissertation):** Crop classes regional distribution in Brazil SITS dataset.
**Description:** A grid of 10 choropleth maps of Brazil (one per crop class) showing geographic concentration. Temporary Crops/Soybean concentrate in the Center-West/North-Center; Sugar Cane/Coffee/Perennial Crops cluster in the Southeast; Palm Oil is a single small patch in the Amazon; Rice forms a coastal/lowland strip — supporting the claim of strong regional crop specialization across Brazil.

#### `figures/6_methodology/datasets/california_bar_crop.pdf`
**Caption (from dissertation):** Crop classes distribution in California SITS dataset.
**Description:** A bar chart of 14 crop classes. Tomatoes is by far the largest (77,442), followed by Wildflowers, Pistachios, Citrus, Cotton; Wheat is the smallest (878) — showing pronounced imbalance, Tomatoes ~88x larger than Wheat.

#### `figures/6_methodology/datasets/california_evi2.pdf`
**Caption (from dissertation):** EVI2 per crop class in California SITS dataset.
**Description:** A grid of 14 small-multiple EVI2 panels. Most classes show one clean, well-defined seasonal bell curve; Citrus shows a double bump; Wheat/Corn shows a clear double-cropping rotation signature (two humps). Curves are visibly tighter and less noisy than Brazil's, with clearer separation between classes.

#### `figures/6_methodology/datasets/texas_bar_crop.pdf`
**Caption (from dissertation):** Crop classes distribution in Texas SITS dataset.
**Description:** A bar chart of 7 crop classes. Wheat dominates (100,647), followed by Cotton, Corn, Rice; Sorghum is smallest (2,123) — the simplest (fewest classes) of the three datasets but still strongly imbalanced.

#### `figures/6_methodology/datasets/texas_evi2.pdf`
**Caption (from dissertation):** EVI2 per crop class in Texas SITS dataset.
**Description:** A grid of 7 small-multiple EVI2 panels. Cotton and Corn show clean, sharp single-peak seasonal curves typical of monocultures; Wheat shows a broad elevated plateau; Sorghum is the noisiest/most irregular class. Curves are visually cleaner than Brazil's, similar to California's.

---

## Chapter 5 — Methodology: Models

#### `figures/6_methodology/meth_graphical_abstract.pdf`
**Caption (from dissertation):** Graphical abstract showing the whole training and inference stages.
**Description:** A "Training Stage" block: samples are split into labeled and unlabeled; unlabeled data pretrains a model with four SSL methods (MM, MoCo, FastSiam, PMSN) to get a pretrained backbone; labeled data plus that backbone are used to fine-tune a model, which trains an ORDER module (one GMM per class). An "Inference Stage" block shows a new time series going through the classifier to get a prediction (e.g. "Corn"), which is then verified by the corresponding ORDER GMM ("Is it really Corn?" → "YES" → confirmed) — summarizing the end-to-end pipeline: acquisition, SSL pretraining, fine-tuning, ORDER training, and classify-then-verify inference.

#### `figures/6_methodology/meth_models.pdf`
**Caption (from dissertation):** Graphical abstract showing the ORDER anomaly detection.
**Description:** Train/validation datasets feed a finetuned backbone+head producing embeddings. Step 1: correctly classified training embeddings form one GMM per class. Step 2: validation embeddings are split into positive/negative samples. Step 3 is a hyperparameter-optimization loop (score validation sets, maximize separation, determine a dynamic F1-based threshold, with a conservative GEMOS fallback). Step 4 shows the decision logic at inference: "Is the GMM score greater than the threshold?" — if not, the label is kept; if yes, it's rerouted to "Unknown" — illustrating how ORDER trains per-class GMMs and decides whether to trust or reject a classifier's prediction.

#### `figures/6_methodology/meth_ssl.pdf`
**Caption (from dissertation):** Graphical abstract showing the different SSL pretrainings with SITS data.
**Description:** Centered on a "SITS Model Backbone." An original sample is augmented into two views (and negative samples from other crops are held in a database); all feed the backbone, mapping into a pretraining embedding space with "MAKE CLOSE" (same-crop) and "MAKE FAR" (different-crop) arrows. Four panels show the four SSL strategies: MM Pretrain (masked/reconstructed points), PMSN Pretrain (combines close+far+reconstruction), MoCo Pretrain (close+far with a memory bank), FastSiam Pretrain (close only, no negatives) — contrasting how each method shapes the embedding space.

---

## Chapter 7 — Results and Discussion

Each of the three datasets (Brazil, California, Texas) has the same set of result-figure types for its best-performing model/pretraining combination: a confusion matrix, a per-class metrics heatmap, right/wrong-prediction separability histograms (ORDER vs. ConfidNet vs. MCP), a few-shot bar chart, a full data-scarcity line chart, and an ORDER anomaly-rate scatter plot.

### Brazil (best model: SITS-BERT++ with MoCo pretraining, 70% training data)

#### `figures/8_results/brazil-finetuning/BERTPP-70.0-MoCo/class_test_gemmos_matrix.pdf`
**Caption (from dissertation):** Best experiment in Brazil Dataset class. Report with 70% in training data (BERT++ with MoCo pretraining).
**Description:** A 10×11 confusion matrix (true classes as rows, predicted classes + "Unknown" as columns). The diagonal dominates, led by Pasture (3641) and Forest Plantation/Temp. Crops (~2200 each). Main confusions: Temp. Crops confused with Pasture and routed to "Unknown"; Pasture also leaks into "Unknown" and Temp. Crops — matching the text's claim that Pasture and Temporary/Perennial Crops are the most problematic classes.

#### `figures/8_results/brazil-finetuning/BERTPP-70.0-MoCo/class_test_gemmos_report.pdf`
**Caption (from dissertation):** Best experiment in Brazil Dataset class. Report with 70% in training data (BERT++ with MoCo pretraining).
**Description:** A per-class metrics heatmap (Precision, Recall, Specificity, F1, G-Mean, IBA, Support). Most classes score in the 90s (Forest Plant. and Palm Oil near-perfect); the weakest are Temp. Crops (F1 75) and Coffee (F1 75); Palm Oil has the smallest support (39 samples) but near-100% metrics.

#### `figures/8_results/brazil-finetuning/BERTPP-70.0-MoCo/hist_combined_test.pdf`
**Caption (from dissertation):** Best experiment in Brazil Dataset with 70% in training data (BERT++ with MoCo pretraining) separability between right and wrong predictions with ORDER, ConfidNet and MCP.
**Description:** A grid of per-class histograms (log-scale) across three confidence methods (ORDER, ConfidNet, MCP); green = correct, pink = incorrect. In the ORDER column, green and pink separate into two distinct humps with a threshold line between them (clear bimodal separation). ConfidNet and MCP show heavy overlap, both piling up at high confidence — illustrating the overconfidence problem the two baselines suffer from that ORDER avoids.

#### `figures/8_results/brazil-finetuning/few_shot_pretraining.pdf`
**Caption (from dissertation):** F1 Weighted of finetuning model per pretraining in few shot (1% of training data) in Brazil dataset.
**Description:** A grouped bar chart (5 architectures × 5 pretraining strategies). Scratch bars are consistently the shortest; MM and MoCo pretraining give much taller bars for BERT/BERT++/CNN (up to ~0.60 F1) — confirming large SSL gains in this 1%-label few-shot regime, especially for BERT-family and CNN models.

#### `figures/8_results/brazil-finetuning/line_training.pdf`
**Caption (from dissertation):** F1 Weighted of finetuning model per pretraining in all data scarcity scenarios in Brazil dataset.
**Description:** A 2×3 grid of line plots (F1 vs. training-data % at 1/10/70%) for each architecture plus a "Classical Models" panel. All DL panels rise steeply toward ~0.85–0.87 at 70%, with pretrained lines starting much higher than Scratch at 1%. The MAMBA panel shows a visible dip at 10% for the MM line before recovering — matching the text's note about an unexpected performance drop for SITS-Mamba with MM between 1% and 10% labels.

#### `figures/8_results/brazil-finetuning/trust_analysis.pdf`
**Caption (from dissertation):** ORDER per model and pretraining in Brazil dataset.
**Description:** A scatter plot of Anomaly Rate (%, 0.01–0.08) vs. F1-Score (0.70–0.90) per model/pretraining combination. Most points cluster between 0.03–0.07 anomaly rate and 0.85–0.875 F1; BERT++ reaches the highest F1 (~0.876). Weaker classical baselines (RF, SVM, LGBM) sit lower on both axes — removing a moderate fraction of ORDER-flagged samples correlates with higher F1 across the stronger deep models.

### California (best model: SITS-Mamba with MM pretraining, 70% training data)

#### `figures/8_results/california-finetuning/MAMBA-70.0-reconstruct/class_test_gemmos_matrix.pdf`
**Caption (from dissertation):** Best experiment in California Dataset with 70% training data (Mamba with MM pretraining).
**Description:** A 14×15 confusion matrix with a strong, near-diagonal structure indicating high overall accuracy. The most visible off-diagonal confusions are Citrus→Unknown, and Pistachios↔Tomatoes/Walnuts mutually confused — matching the text's discussion of spectral-temporal overlap between Pistachios and Tomatoes.

#### `figures/8_results/california-finetuning/MAMBA-70.0-reconstruct/class_test_gemmos_report.pdf`
**Caption (from dissertation):** Best experiment in California Dataset with 70% training data (Mamba with MM pretraining).
**Description:** A per-class metrics heatmap, nearly all cells 95–100 (uniformly high performance); Citrus, Almonds, Wildflower reach 100 across the board. Wheat's Precision (87) is the one visibly weaker cell, consistent with the text noting Wheat is confused with Alfalfa/Rice.

#### `figures/8_results/california-finetuning/MAMBA-70.0-reconstruct/hist_combined_test.pdf`
**Caption (from dissertation):** Best experiment in California Dataset with 70% training data (Mamba with MM pretraining), separability between right and wrong predictions with ORDER (Y-axis in logarithmic scale).
**Description:** Per-class histograms across ORDER/ConfidNet/MCP. ORDER shows a broad green hump of correct predictions with a threshold line and a smaller incorrect mass below it (good separation). ConfidNet is nearly flat/collapsed; MCP is heavily skewed toward high confidence for both correct and incorrect predictions, illustrating its overconfidence.

#### `figures/8_results/california-finetuning/few_shot_pretraining.pdf`
**Caption (from dissertation):** F1 Weighted of finetuning model per pretraining in few shot (0.1% of training data) in California dataset.
**Description:** A grouped bar chart. CNN shows by far the largest Scratch-vs-pretrained gap (Scratch ~0.48 vs. MM ~0.85) — indicating CNN benefits most from SSL pretraining in this extreme few-shot regime; other architectures show smaller gaps.

#### `figures/8_results/california-finetuning/line_training.pdf`
**Caption (from dissertation):** F1 Weighted of finetuning model per pretraining in all data scarcity scenarios in California dataset.
**Description:** A 2×3 grid of line plots. Curves start with some spread at 1% (lowest for CNN, ~0.48–0.85) and converge tightly near 1.0 by 70% training data across all architectures, including the classical-models panel.

#### `figures/8_results/california-finetuning/trust_analysis.pdf`
**Caption (from dissertation):** ORDER per model and pretraining in California dataset.
**Description:** A scatter plot of Anomaly Rate vs. F1 (0.95–1.00). Most points cluster tightly around 0.97–0.985 F1 at low anomaly rates; RF is a clear outlier at the bottom (~0.953 F1) — ORDER achieves only marginal, hard-to-distinguish gains in this already high-accuracy dataset.

### Texas (best model: SITS-LSTM with FastSiam pretraining, 70% training data)

#### `figures/8_results/texas-finetuning/LSTM-70.0-FastSiam/class_test_gemmos_matrix.pdf`
**Caption (from dissertation):** Best experiment in Texas Dataset with 70% in training data (LSTM with FastSiam pretraining).
**Description:** A 7×8 confusion matrix where the diagonal totally dominates (all classes in the thousands to ~20,000 correct) while every off-diagonal cell is single/low-double digits — near-perfect class separation with only scattered, tiny confusion between crop types.

#### `figures/8_results/texas-finetuning/LSTM-70.0-FastSiam/class_test_gemmos_report.pdf`
**Caption (from dissertation):** Best experiment in Texas Dataset with 70% in training data (LSTM with FastSiam pretraining).
**Description:** A per-class metrics heatmap; Corn, Cotton, Oats, and Wheat score 100 across every metric; Sorghum (smallest class, 420 samples) is the weakest at 97 across Precision/F1/IBA — metrics stay near-ceiling even for the least-represented class.

#### `figures/8_results/texas-finetuning/LSTM-70.0-FastSiam/hist_combined_test.pdf`
**Caption (from dissertation):** Best experiment in Texas Dataset with 70% in training data (LSTM with FastSiam pretraining) separability between right and wrong predictions with ORDER, ConfidNet and MCP.
**Description:** Per-class histograms across ORDER/ConfidNet/MCP. ConfidNet is essentially flat for every class; MCP shows correct and incorrect predictions both piled at maximum confidence (heavily overlapping); ORDER shows a wide correct-prediction hump with a threshold line and a much smaller incorrect mass to its left — visibly better separation, with fewer errors overall than the Brazil dataset.

#### `figures/8_results/texas-finetuning/few_shot_pretraining.pdf`
**Caption (from dissertation):** F1 Weighted of finetuning model per pretraining in few shot (0.1% of training data) in Texas dataset.
**Description:** A grouped bar chart. BERT shows the largest spread (Scratch ≈0.56 vs. FastSiam ≈0.93); other architectures show every pretraining bar clustered tightly high (~0.86–0.95) — SSL pretraining mainly matters for the plain BERT model in this extreme few-shot Texas scenario.

#### `figures/8_results/texas-finetuning/line_training.pdf`
**Caption (from dissertation):** F1 Weighted of finetuning model per pretraining in all data scarcity scenarios in Texas dataset.
**Description:** A grid of line charts. The BERT panel shows the widest starting spread at 1% (~0.56 to ~0.97), converging to ~1.0 by 70%. All other panels (including classical models) start already high (~0.86–0.95) at 1% and quickly flatten near 1.0 — Texas is an "easy" dataset where nearly all models/pretrainings converge to near-perfect F1 once even 10% of labels are available.

#### `figures/8_results/texas-finetuning/trust_analysis.pdf`
**Caption (from dissertation):** ORDER per model and pretraining in Texas dataset.
**Description:** A scatter plot of Anomaly Rate (~0.0005–0.003) vs. F1 (0.95–1.00). Most points cluster tightly in the upper-left (anomaly rate below ~0.0015, F1 ~0.995–0.997); a few MM-pretrained points extend further right at similarly high F1; two shallow-model Scratch points (SVM, LGBM) and RF sit apart with lower F1 (~0.978–0.989) — on Texas, where baseline accuracy is already near-ceiling, ORDER flags very few samples as anomalous across all models.

---

## Appendix: figures present in the repo but not currently rendered in the compiled dissertation

These files exist under `figures/` and were described for completeness, but their `\includegraphics` call is commented out in the current `.tex` source, so they do **not** appear in `dissertation.pdf`. Listed here in case they get re-enabled later — not part of the dissertation's actual figure list above.

#### `figures/6_methodology/aglgis.png`
**Would-be caption:** Example of the AGLgis plugin visualizing the Amazon River in Brazil.
**Description:** A false-color satellite image showing a winding river channel rendered in blue/purple tones via the AGLgis QGIS plugin's SAR backscatter visualization, with a tributary junction and small map-style place labels, demonstrating the plugin's radar-based waterway/flood-monitoring output over the Amazon.

#### `figures/8_results/brazil-finetuning/BERTPP-70.0-MoCo/tsne_embeddings.pdf`
**Would-be caption:** Best experiment in Brazil Dataset with 70% in training data (BERT++ with MoCo pretraining) latent space with TSNE manifold.
**Description:** Four t-SNE scatter plots of the model's embedding space colored by crop class: "True Classes," "Pred Classes," and the same two views with ORDER-flagged anomalies removed ("Wo Anom."). Points form several distinct, well-separated color clusters; the True/Pred panels look nearly identical (confirming high accuracy), and removing anomalies tightens the clusters slightly.

#### `figures/8_results/california-finetuning/MAMBA-70.0-reconstruct/tsne_embeddings.pdf`
**Would-be caption:** Best experiment in California Dataset with 70% in training data (Mamba with MM pretraining) latent space with TSNE manifold.
**Description:** Four t-SNE scatter plots (True/Pred Classes, with/without anomalies) of the 14-class California embedding space, showing distinct, well-separated color clusters; the "Wo Anom." panels show visibly tighter, cleaner clusters than the full panels.

#### `figures/8_results/texas-finetuning/LSTM-70.0-FastSiam/tsne_embeddings.pdf`
**Would-be caption:** Best experiment in Texas Dataset with 70% in training data (LSTM with FastSiam pretraining) latent space with TSNE manifold.
**Description:** Four t-SNE scatter plots of the Texas embedding space; Cotton and Wheat form two large, adjacent but distinguishable clouds, Corn forms several compact clusters, Rice one dense blob, Oats/Sorghum small isolated groups. The "True"/"Pred" and "Wo Anom." panels all look nearly identical, confirming high accuracy with only a handful of stray points removed by ORDER filtering.
