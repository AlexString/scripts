#!/bin/bash

# Script that makes a new react + typescript + tailwind 

# Functions ------------------

create_tailwind_config(){
cat > tailwind.config.js << EOF
module.exports = {
	content: [
		"./index.html",
		"./src/**/*.{js,ts,jsx,tsx}",
	],
	theme: {
		extend: {},
	},
	plugins: [],
}
EOF
}

add_tailwind_directives(){
local index="./src/index.css"
cat >> $index << EOF

@tailwind base;
@tailwind components;
@tailwind utilities;
EOF
}

create_app(){
local app="./src/App.tsx"
cat > $app << EOF
import { useState } from 'react'
import './App.css'

function App() {

	return (
		<h1 className="text-3xl font-bold underline">
			Hello world!
		</h1>
	)
}

export default App
EOF
}

clean_project(){
	local src=./src

	rm $src/favicon.svg
	rm $src/logo.svg
	rm $src/App.tsx
}

echo_sleep(){
	echo $1
	sleep 2
}

# Main ------------------

if [ -z "$1" ]; then
	echo_sleep "No project name supplied. (e.g 'vite_project')"
	exit 1
fi

readonly PROJECT_NAME=$1

echo_sleep "Initializing vite with npm using ${PROJECT_NAME} as name..."
npm init vite $PROJECT_NAME

echo_sleep "Changing to ${PROJECT_NAME} dir..." 
cd $PROJECT_NAME

echo_sleep "Installing Tailwind CSS..." 
npm install -D tailwindcss postcss autoprefixer

echo_sleep "Initializing tailwindcss..."
npx tailwindcss init -p

echo_sleep "Creating tailwind config to ./tailwind.config.js file..."
create_tailwind_config

echo_sleep "Adding tailwind directives to ./src/index.css file..." 
add_tailwind_directives

echo_sleep "Removing dummy data from project..."
clean_project

echo_sleep "creating App.tsx file..."
create_app

echo_sleep "(npm run dev) - STARTING PROJECT NOW..."
npm run dev