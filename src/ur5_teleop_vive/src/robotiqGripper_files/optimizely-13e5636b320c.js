"use strict";(globalThis.webpackChunk=globalThis.webpackChunk||[]).push([["optimizely","optimizely-utils","uuid"],{67404:(e,t,n)=>{function o(e){return r(e)[0]}function r(e){let t=[];for(let n of a()){let[o,r]=n.trim().split("=");e===o&&void 0!==r&&t.push({key:o,value:r})}return t}function a(){try{return document.cookie.split(";")}catch{return[]}}function i(e,t,n=null,o=!1,r="lax"){let a=document.domain;if(null==a)throw Error("Unable to get document domain");a.endsWith(".github.com")&&(a="github.com");let i="https:"===location.protocol?"; secure":"",c=n?`; expires=${n}`:"";!1===o&&(a=`.${a}`);try{document.cookie=`${e}=${t}; path=/; domain=${a}${c}${i}; samesite=${r}`}catch{}}function c(e,t=!1){let n=document.domain;if(null==n)throw Error("Unable to get document domain");n.endsWith(".github.com")&&(n="github.com");let o=new Date().getTime(),r=new Date(o-1).toUTCString(),a="https:"===location.protocol?"; secure":"",i=`; expires=${r}`;!1===t&&(n=`.${n}`);try{document.cookie=`${e}=''; path=/; domain=${n}${i}${a}`}catch{}}n.d(t,{$1:()=>r,d8:()=>i,ej:()=>o,kT:()=>c})},31063:(e,t,n)=>{function o(e){return e.toLowerCase().replace(/-(.)/g,function(e,t){return t.toUpperCase()})}function r(e){let t={};for(let{name:n,value:r}of e.attributes)if(n.startsWith("data-optimizely-meta-")){let e=n.replace("data-optimizely-meta-","");r&&r.trim().length&&(t[o(e)]=r)}return t}n.d(t,{t:()=>r})},68379:(e,t,n)=>{let o;var r=n(24601),a=n(89359),i=n(48266),c=n(83314);let l={handleError(e){d(e)}};function u(){s();let e=document.head.querySelector("meta[name=optimizely-datafile]")?.content;return(0,i.Fs)({datafile:e,errorHandler:l})}function s(){let e=m("optimizely.logLevel");e?(0,i.Ub)(e):(0,i.EK)(null)}function m(e){try{return window.localStorage?.getItem(e)}catch(e){return null}}async function d(e){if(!c.Gb||e.message.startsWith("Optimizely::InvalidExperimentError:"))return;let t=document.head?.querySelector('meta[name="browser-optimizely-client-errors-url"]')?.content;if(!t)return;let n={message:e.message,stack:e.stack,stacktrace:(0,r.cI)(e),sanitizedUrl:(0,a.S)()||window.location.href,user:(0,r.aJ)()||void 0};try{await fetch(t,{method:"post",body:JSON.stringify(n)})}catch{}}var f=n(67404),p=n(82918),h=n(36071),y=n(59753),g=n(31063);!async function(){o=u(),await o.onReady()}(),(0,y.on)("click","[data-optimizely-event]",function(e){if(!o)return;let t=e.currentTarget,n=t.getAttribute("data-optimizely-event")||"",[r,a]=n.trim().split(/\s*,\s*/),i=(0,g.t)(t);r&&a?o.track(r,a,i):r&&o.track(r,(0,p.b)(),i)}),(0,h.N7)("[data-optimizely-experiment]",e=>{if(!o)return;let t=e.getAttribute("data-optimizely-experiment");if(!t||e.hidden)return;let n=(0,g.t)(e),r=o.activate(t,(0,p.b)(),n);if(!r)return;let a=e.querySelectorAll("[data-optimizely-variation]");for(let e of a){let t=e.getAttribute("data-optimizely-variation");e.hidden=t!==r}});let _=document.querySelector('meta[name="enabled-homepage-translation-languages"]')?.getAttribute("content")?.split(",")||[],b=(0,f.$1)("_locale_experiment").length>0&&"ko"===(0,f.$1)("_locale_experiment")[0].value&&_.includes("ko");async function w(){let e="ko_homepage_translation",t=(0,p.b)(),n=f.$1("_locale")[0]?.value?.slice(0,2);o.setForcedVariation(e,t,n),o.activate(e,t);let r=document.querySelectorAll("[data-optimizely-variation]");for(let e of r)e.hidden=n!==e.getAttribute("data-optimizely-variation");for(let e of document.querySelectorAll('form[action^="/join"]'))e.addEventListener("submit",()=>{o.track("submit.homepage_signup",t)});for(let e of document.querySelectorAll('a[href^="/join"]'))e.addEventListener("click",()=>{o.track("click.homepage_signup",t)})}async function v(){document.getElementById("signup-form")?.addEventListener("submit",()=>{let e=(0,p.b)();o.activate("ko_homepage_translation",e),o.track("submit.create_account",e)})}async function k(){if(!o)return;let e=(0,p.b)();o.activate("test_experiment",e),o.track("test_event",e)}b&&"/"===window.location.pathname&&w(),b&&"/join"===window.location.pathname&&v(),"/settings/profile"===window.location.pathname&&k()},328:(e,t,n)=>{function o(){return crypto.randomUUID()}n.r(t),n.d(t,{v4:()=>o})},89359:(e,t,n)=>{function o(e){let t=document.querySelectorAll(e);if(t.length>0)return t[t.length-1]}function r(){let e=o("meta[name=analytics-location]");return e?e.content:window.location.pathname}function a(){let e=o("meta[name=analytics-location-query-strip]"),t="";e||(t=window.location.search);let n=o("meta[name=analytics-location-params]");for(let e of(n&&(t+=(t?"&":"?")+n.content),document.querySelectorAll("meta[name=analytics-param-rename]"))){let n=e.content.split(":",2);t=t.replace(RegExp(`(^|[?&])${n[0]}($|=)`,"g"),`$1${n[1]}$2`)}return t}function i(){return`${window.location.protocol}//${window.location.host}${r()+a()}`}n.d(t,{S:()=>i})},24601:(e,t,n)=>{n.d(t,{aJ:()=>S,cI:()=>v,eK:()=>g});var o=n(82918),r=n(83314),a=n(28382),i=n(89359),c=n(68202),l=n(53729),u=n(86283),s=n(46426);let m=!1,d=0,f=Date.now(),p=new Set(["Failed to fetch","NetworkError when attempting to fetch resource."]);function h(e){return e instanceof Error||"object"==typeof e&&null!==e&&"name"in e&&"string"==typeof e.name&&"message"in e&&"string"==typeof e.message}function y(e){return!!("AbortError"===e.name||"TypeError"===e.name&&p.has(e.message)||e.name.startsWith("ApiError")&&p.has(e.message))}function g(e,t={}){if((0,s.c)("FAILBOT_HANDLE_NON_ERRORS")){if(!h(e)){let n=Error(),o={type:"UnknownError",value:`Unable to report error, due to a thrown non-Error type: ${typeof e}`,stacktrace:v(n)};_(w(o,t));return}y(e)||_(w(b(e),t))}else y(e)||_(w(b(e),t))}async function _(e){if(!z())return;let t=document.head?.querySelector('meta[name="browser-errors-url"]')?.content;if(t){if($(e.error.stacktrace)){m=!0;return}d++;try{await fetch(t,{method:"post",body:JSON.stringify(e)})}catch{}}}function b(e){return{type:e.name,value:e.message,stacktrace:v(e)}}function w(e,t={}){return Object.assign({error:e,sanitizedUrl:(0,i.S)()||window.location.href,readyState:document.readyState,referrer:(0,c.wP)(),timeSinceLoad:Math.round(Date.now()-f),user:S()||void 0,bundler:l.A7,ui:Boolean(document.querySelector('meta[name="ui"]'))},t)}function v(e){return(0,a.Q)(e.stack||"").map(e=>({filename:e.file||"",function:String(e.methodName),lineno:(e.lineNumber||0).toString(),colno:(e.column||0).toString()}))}let k=/(chrome|moz|safari)-extension:\/\//;function $(e){return e.some(e=>k.test(e.filename)||k.test(e.function))}function S(){let e=document.head?.querySelector('meta[name="user-login"]')?.content;if(e)return e;let t=(0,o.b)();return`anonymous-${t}`}let E=!1;function z(){return!E&&!m&&d<10&&(0,r.Gb)()}if(u.iG?.addEventListener("pageshow",()=>E=!1),u.iG?.addEventListener("pagehide",()=>E=!0),"function"==typeof BroadcastChannel){let e=new BroadcastChannel("shared-worker-error");e.addEventListener("message",e=>{g(e.data.error)})}}},e=>{var t=t=>e(e.s=t);e.O(0,["vendors-node_modules_stacktrace-parser_dist_stack-trace-parser_esm_js-node_modules_github_bro-a4c183","vendors-node_modules_github_selector-observer_dist_index_esm_js","vendors-node_modules_optimizely_optimizely-sdk_dist_optimizely_browser_es_min_js-node_modules-089adc","ui_packages_soft-nav_soft-nav_ts"],()=>t(68379));var n=e.O()}]);
//# sourceMappingURL=optimizely-21d48b38bea7.js.map