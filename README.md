
# 📸 Projection 3D vers 2D avec calibration caméra

Ce projet simule la projection d’un objet 3D vers un plan 2D à l’aide d’une caméra virtuelle.  
Il met en œuvre des matrices **intrinsèques** et **extrinsèques** pour modéliser le comportement d’une caméra réelle, et applique une transformation géométrique à un modèle 3D au format `.obj`.

---

## 🎯 Objectif du projet

- Lire un modèle 3D (format Wavefront `.obj`)
- Appliquer une transformation géométrique via une **matrice de projection**
- Projeter les sommets 3D sur un plan 2D
- Afficher l'objet en 3D et son rendu projeté en 2D côte à côte

---

## 🧰 Technologies utilisées

- **MATLAB**
- Fichier `.obj` comme source 3D
- Concepts de **géométrie projective**
- **Matrice de calibration de caméra** (K)
- **Transformation 3D** (Rotation + Translation)

---

## 📂 Structure du projet

- `readObj.m` – Fonction pour lire un fichier `.obj`
- `test3DD.m` – Script principal : lecture, projection, visualisation
- `nta.obj` – Modèle 3D utilisé (maillage)

---

## 🖼️ Résultats visuels

- Vue 3D du modèle original
- Vue 2D projetée simulant une caméra virtuelle
- Utilisation de `patch()` pour afficher les faces

---

## ⚠️ Remarque importante

> Ce script a été testé avec **MATLAB**. Assurez-vous d’avoir le fichier `.obj` dans le même répertoire.  
> Le modèle utilisé ici est simplifié pour une démonstration claire de la projection.

---

## 👨‍💻 Réalisé par

- **Abderrahman Ferjouchia**
- Master Informatique et Électronique des Systèmes Embarqués  
  Université Mohammed V – Rabat  
  Année universitaire 2024/2025
