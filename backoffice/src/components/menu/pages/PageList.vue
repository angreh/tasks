<template>
    <ul>
        <li><router-link v-on:click.native="activateTabs" to="/">{{ $t("Dashboard") }}</router-link></li>
        <li><router-link v-on:click.native="activateTabs" to="/about">{{ $t("About") }}</router-link></li>
    </ul>
</template>